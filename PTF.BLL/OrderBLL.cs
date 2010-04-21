using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;
using System.ComponentModel;

using System.Linq.Dynamic;
using System.Security.Permissions;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class OrderBLL : GenericBLL<Order, int>
    {
        #region Get Methods
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Order> GetByUser(Guid currentUser)
        {
            var list = OrderBLL.GetByInclusionExample(new Order() { UserID = currentUser }, "UserID");
            return list.AsQueryable().OrderBy("DateRequested DESC").ToList();
        }

        /// <summary>
        /// Check to see if the user provided is the proper owner of the order
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="userID"></param>
        /// <returns></returns>
        public static bool ValidateOwner(int orderID, Guid userID)
        {
            var order = OrderBLL.GetByID(orderID);

            return (order.UserID == userID);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Order> GetAllSorted(string propertyName)
        {
            // default sorting
            if (string.IsNullOrEmpty(propertyName))
            {
                return OrderBLL.GetAll("id", false);
            }
            // has a space, so it has a DESC in it for descending sorting
            else if (propertyName.Contains(' '))
            {
                // get the property name
                string prop = propertyName.Substring(0, propertyName.IndexOf(' '));

                return OrderBLL.GetAll(prop, false);
            }
            // just the property name it is for ascending
            else
            {
                return OrderBLL.GetAll(propertyName, true);
            }
        }
        #endregion

        #region Modify Methods
        [PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
        [PrincipalPermission(SecurityAction.Deny, Role="User")]
        [PrincipalPermission(SecurityAction.Deny, Role="Reader")]
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Order newOrder)
        {
            if (newOrder.RechargeNumber == null)
            {
                newOrder.ContractNumber = string.Empty;
            }
            else
            {
                newOrder.ContractNumber = null;
            }

            newOrder.Status = StatusBLL.GetByName(StatusText.STR_Pending);

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newOrder);

                ts.CommittTransaction(); //commit the transaction
            }

            // notify the administrator and the administrator
            EmailBLL.OrderCreated(newOrder);
        }

        [PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
        [PrincipalPermission(SecurityAction.Deny, Role = "Reader")]
        public static void Update(Order order)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref order);

                ts.CommittTransaction();
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void UpdateStatus(Order order)
        {
            // first check for pending
            bool pending = true;

            foreach (SubOrder so in order.SubOrders)
            {
                // check if any constructs have been added yet
                // if it has been added then we are definietly not in a pending state
                if (so.Constructs.Count != 0)
                {
                    pending = false;
                    break;
                }
            }

            // we are pending, set the status
            if (pending)
            {
                order.Status = StatusBLL.GetByName(StatusText.STR_Pending);

                OrderBLL.Update(order);
            }
            // not in a pending state, find out if we are complete
            else
            {
                bool complete = true;

                foreach (SubOrder so in order.SubOrders)
                {
                    // if any of the sub orders do not have constructs we can't be done
                    // so it's initiated since there is at least one started construct
                    if (so.Constructs.Count == 0)
                    {
                        complete = false;
                        break;
                    }

                    // go through all the constructs to check if they are done
                    // if one isn't done the whole order can't be done
                    foreach (Construct c in so.Constructs)
                    {
                        // if the construct isn't complete we can't be done.
                        if (!c.Status.IsComplete)
                        {
                            complete = false;
                            break;
                        }
                    }
                }

                if (complete)
                {
                    // order is complete
                    order.Status = StatusBLL.GetByName(StatusText.STR_Complete);
                }
                else
                {
                    order.Status = StatusBLL.GetByName(StatusText.STR_Initiated);
                }
            }
        }
        #endregion
    }
}

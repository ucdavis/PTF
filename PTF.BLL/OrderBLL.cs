using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;
using System.ComponentModel;


namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class OrderBLL : GenericBLL<Order, int>
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Order newOrder, string mailFromAddress, string mailToAddress)
        {
            if (newOrder.RechargeNumber == null)
            {
                newOrder.ContractExecuted = false;
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newOrder);

                ts.CommittTransaction(); //commit the transaction
            }

            // notify the administrator
            EmailBLL.OrderCreated(newOrder, mailFromAddress, mailToAddress);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Order> GetByUser(Guid currentUser)
        {
            return OrderBLL.GetByInclusionExample(new Order() { UserID = currentUser }, "UserID");
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
    }
}

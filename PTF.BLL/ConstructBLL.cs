using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;
using CAESDO.PTF.Data;
using System.Security.Permissions;

namespace CAESDO.PTF.BLL
{
    public class ConstructBLL : GenericBLL<Construct, int>
    {
        #region Get Methods
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Construct> GetByOrder(int orderID)
        {
            return GetByOrder(OrderBLL.GetByID(orderID));
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Construct> GetByOrder(Order order)
        {
            return ConstructBLL.daoFactory.GetConstructDao().GetByOrder(order);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Construct> GetByCode(string constructCode)
        {
            var construct = new Construct()
            {
                ConstructCode = constructCode
            };

            return ConstructBLL.GetByInclusionExample(construct, "ConstructCode");
        }
        #endregion

        #region Modify Methods
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Construct obj)
        {
            obj.DateCreated = DateTime.Now;

            // set the status to pending
            obj.Status = StatusBLL.GetByName(StatusText.STR_Pending);

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }

            NHibernateSessionManager.Instance.EvictObject(obj);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(Construct construct)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref construct);

                ts.CommittTransaction();
            }
        }

        /// <summary>
        /// Change the recharge amount.
        /// </summary>
        /// <param name="constructID"></param>
        /// <param name="rechargeAmount"></param>
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void ChangeRechargeAmount(int constructID, decimal rechargeAmount)
        {
            Construct construct = ConstructBLL.GetByID(constructID);
            construct.RechargeAmount = rechargeAmount;

            ConstructBLL.Update(construct);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void UpdateStatus(Construct construct)
        {
            // no experiments exist
            if (construct.Experiments.Count == 0)
            {
                construct.Status = StatusBLL.GetByName(StatusText.STR_Pending);
            }
            // experiments exist
            else if (construct.Status.Name == StatusText.STR_Complete && construct.InvoiceDate != null)
            {
                // do nothing, the status should not be allowed to be changed once it has been billed
            }
            else
            {
                int count = 0;

                foreach (Experiment e in construct.Experiments)
                {
                    foreach (Plant p in e.Plants)
                    {
                        if (p.Status.Name == StatusText.STR_Shipped)
                        {
                            count++;
                        }
                    }
                }

                // all experiments are complete
                if (count >= construct.SubOrder.NumberOfPlants)
                {
                    construct.Status = StatusBLL.GetByName(StatusText.STR_Complete);

                    // email the administrator
                    EmailBLL.ConstructComplete(construct);
                }
                else
                {
                    construct.Status = StatusBLL.GetByName(StatusText.STR_Initiated);
                }
            }

            ConstructBLL.Update(construct);

            // update the order status
            OrderBLL.UpdateStatus(construct.Order);
        }
        #endregion


    }
}

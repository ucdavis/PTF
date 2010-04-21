using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    public class ConstructBLL : GenericBLL<Construct, int>
    {
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
        public static void ChangeRechargeAmount(int constructID, decimal rechargeAmount)
        {
            Construct construct = ConstructBLL.GetByID(constructID);
            construct.RechargeAmount = rechargeAmount;

            ConstructBLL.Update(construct);
        }

        public static void UpdateStatus(Construct construct)
        {
            // no experiments exist
            if (construct.Experiments.Count == 0)
            {
                construct.Status = StatusBLL.GetByName(StatusText.STR_Pending);
            }
            // experiments exist
            else
            {
                bool complete = true;

                foreach (Experiment e in construct.Experiments)
                {
                    if (!e.Status.IsComplete)
                    {
                        complete = false;
                        break;
                    }
                }

                // all experiments are complete
                if (complete)
                {
                    construct.Status = StatusBLL.GetByName(StatusText.STR_Complete);
                }
                else
                {
                    construct.Status = StatusBLL.GetByName(StatusText.STR_Initiated);
                }
            }

            ConstructBLL.Update(construct);
        }
    }
}

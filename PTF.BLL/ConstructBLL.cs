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
            //obj.Status = StatusBLL.GetByName(StatusNames.Pending);

            //obj.ContractExecuted = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }
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
        /// Sets the construct to a hold pending contract status validating the rules for this status.
        /// </summary>
        /// <param name="construct"></param>
        /// <returns></returns>
        public static Construct SetHoldPendingContract(Construct construct)
        {
            //// just make sure it's not complete or cancelled
            //if (construct.Status.Name != StatusText.STR_Complete && construct.Status.Name != StatusText.STR_Cancelled)
            //{
            //    construct.Status = StatusBLL.GetByName(StatusText.STR_HoldPendingContract);
            //}

            return construct;
        }

        /// <summary>
        /// Sets the construct to a pending status validating the rules for this status.
        /// </summary>
        /// <param name="construct"></param>
        /// <returns></returns>
        public static Construct SetPending(Construct construct)
        {
            //// it can not be in complete or cancelled status
            //if (construct.Status.Name != StatusText.STR_Complete 
            //    && construct.Status.Name != StatusText.STR_Cancelled
            //    //TODO: also can not have any experiments
            //    )
            //{
            //    construct.Status = StatusBLL.GetByName(StatusText.STR_Pending);
            //}

            return construct;
        }
    }
}

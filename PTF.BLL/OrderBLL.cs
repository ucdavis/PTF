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
        public static void Insert(Order newOrder)
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
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Order> GetByUser(Guid currentUser)
        {
            return OrderBLL.GetByInclusionExample(new Order() { UserID = currentUser }, "UserID");
        }
    }
}

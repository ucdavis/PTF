using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    public class OrderBLL : GenericBLL<Order, int>
    {
        public void Insert(Order newOrder)
        {         
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newOrder);

                ts.CommittTransaction(); //commit the transaction
            }
        }
    }
}

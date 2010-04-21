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
            obj.Status = StatusBLL.GetByName(StatusNames.Pending);

            obj.ContractExecuted = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }
        }
    }
}

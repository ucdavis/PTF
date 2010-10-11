using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.Security.Permissions;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    public class SubOrderBLL : GenericBLL<SubOrder, int>
    {
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void Update(SubOrder suborder)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref suborder);

                ts.CommittTransaction();
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void Delete(SubOrder suborder)
        {
            using (var ts = new TransactionScope())
            {
                Remove(suborder);

                ts.CommittTransaction();
            }
        }
    }
}

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
    [DataObject]
    public class OperatorBLL : GenericBLL<Operator, int>
    {
        #region Get Methods
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Operator> GetSelectable()
        {
            Operator op = new Operator() { IsSelectable = true };

            return OperatorBLL.GetByInclusionExample(op, "OperatorName", true, "IsSelectable");
        }

        #endregion

        #region Modify Methods
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Operator obj)
        {
            obj.IsSelectable = true;    // This value needs to be set to true by default

            if (string.IsNullOrEmpty(obj.OperatorCode))
            {
                obj.OperatorCode = null;
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(Operator obj)
        {
            // we need to deal with the issue that the effective id is not writable, but the object should be editable
            var op = OperatorBLL.GetByID(obj.ID);

            if (op.ID != obj.EffectiveID)
            {
                op.OperatorCode = obj.EffectiveID.ToString();
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref op);

                ts.CommittTransaction();
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static void Delete(Operator obj)
        {
            // need to get the object first, obj may only contain the id at a minimum
            var op = OperatorBLL.GetByID(obj.ID);

            op.IsSelectable = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref op);

                ts.CommittTransaction();
            }
        }
        #endregion





    }
}

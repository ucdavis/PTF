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
    public class ExperimentBLL : GenericBLL<Experiment, int>
    {
        #region Get Methods
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Experiment> GetByConstruct(int constructID)
        {
            return GetByConstruct(ConstructBLL.GetByID(constructID));
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Experiment> GetByConstruct(Construct construct)
        {
            return ExperimentBLL.daoFactory.GetExperimentDao().GetByConstruct(construct);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Experiment> GetByCode(string experimentCode)
        {
            var exp = new Experiment()
            {
                ExperimentCode = experimentCode
            };

            return ExperimentBLL.GetByInclusionExample(exp, "ExperimentCode");
        }
        #endregion

        #region Modify Methods
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Experiment obj)
        {
            obj.DateStarted = DateTime.Now;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }

            NHibernateSessionManager.Instance.EvictObject(obj);

            ConstructBLL.UpdateStatus(obj.Construct);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(Experiment experiment)
        {
            if (experiment.Construct.IsLocked)
            {
                throw (MessageException) new Exception("Construct (" + experiment.Construct.ConstructCode + ") has been billed and cannot be changed.");
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref experiment);

                ts.CommittTransaction();
            }
        }
        #endregion

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void Delete(Experiment experiment)
        {
            using (var ts = new TransactionScope())
            {
                Remove(experiment);

                ts.CommittTransaction();
            }
        }


    }
}

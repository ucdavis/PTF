using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class ExperimentBLL : GenericBLL<Experiment, int>
    {
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

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(Experiment experiment)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref experiment);

                ts.CommittTransaction();
            }
        }

        public static List<Experiment> GetByCode(string experimentCode)
        {
            var exp = new Experiment()
            {
                ExperimentCode = experimentCode
            };

            return ExperimentBLL.GetByInclusionExample(exp, "ExperimentCode");
        }
    }
}

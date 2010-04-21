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

        ///// <summary>
        ///// Allow to override algorithm to mark an experiment complete so that the construct will be marked complete.
        ///// Only allowed if there are no plants available for this experiment.
        ///// </summary>
        ///// <param name="experiment"></param>
        //public static void MarkComplete(Experiment experiment)
        //{
        //    if (experiment.Plants.Count <= 0)
        //    {
        //        // save the experiment
        //        ExperimentBLL.Update(experiment);

        //        // update the status of the construct
        //        ConstructBLL.UpdateStatus(experiment.Construct);
        //    }
        //}
    }
}

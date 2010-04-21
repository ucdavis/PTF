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

            // set the status to pending
            obj.Status = StatusBLL.GetByName(StatusText.STR_Pending);

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

        public static void UpdateStatus(Experiment experiment)
        {
            if (experiment.Plants.Count == 0)
            {
                experiment.Status = StatusBLL.GetByName(StatusText.STR_Pending);
            }
            else // some plants exist for this experiment
            {
                bool complete = true;

                foreach (Plant p in experiment.Plants)
                {
                    if (!p.Status.IsComplete)
                    {
                        complete = false;
                        break;
                    }
                }

                // all plants are complete
                if (complete)
                {
                    experiment.Status = StatusBLL.GetByName(StatusText.STR_Complete);
                }
                else
                {
                    // some plants are not complete yet.
                    experiment.Status = StatusBLL.GetByName(StatusText.STR_Initiated);
                }
            }

            // save the experiment
            ExperimentBLL.Update(experiment);

            // update the status of the construct
            ConstructBLL.UpdateStatus(experiment.Construct);
        }

        /// <summary>
        /// Allow to override algorithm to mark an experiment complete so that the construct will be marked complete.
        /// Only allowed if there are no plants available for this experiment.
        /// </summary>
        /// <param name="experiment"></param>
        public static void MarkComplete(Experiment experiment)
        {
            if (experiment.Plants.Count <= 0)
            {
                // set the status
                experiment.Status = StatusBLL.GetByName(StatusText.STR_Complete);

                // save the experiment
                ExperimentBLL.Update(experiment);

                // update the status of the construct
                ConstructBLL.UpdateStatus(experiment.Construct);
            }
        }
    }
}

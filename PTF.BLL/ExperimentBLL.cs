using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class ExperimentBLL : GenericBLL<Experiment, int>
    {
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
    }
}

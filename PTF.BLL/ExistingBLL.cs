using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PTF.Data.Existing;
using System.ComponentModel;
using System.Linq.Dynamic;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class ExistingBLL
    {
        protected ExistingDataContext db = new ExistingDataContext();

        [DataObjectMethod(DataObjectMethodType.Select)]
        public System.Linq.IQueryable<ExistingConstructInventory> GetAllConstructs(string sortExp)
        {
            if (string.IsNullOrEmpty(sortExp))
            {
                sortExp = "Construct_Code";
            }

            return db.ExistingConstructInventories.OrderBy(sortExp);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public System.Linq.IQueryable<ExistingExperimentInventory> GetAllExperiments(string sortExp)
        {
            if (string.IsNullOrEmpty(sortExp))
            {
                sortExp = "Experiment";
            }

            return db.ExistingExperimentInventories.OrderBy(sortExp);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public System.Linq.IQueryable<ExistingPlantInventory> GetAllPlants(string sortExp)
        {
            if (string.IsNullOrEmpty(sortExp))
            {
                sortExp = "Pedigree";
            }

            return db.ExistingPlantInventories.OrderBy(sortExp);
        }
    }
}

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
    public class PlantBLL : GenericBLL<Plant, int>
    {
        #region Get Methods
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Plant> GetAllSorted(string propertyName)
        {
            // default sorting
            if (string.IsNullOrEmpty(propertyName))
            {
                return PlantBLL.GetAll("id", false);
            }
            // has a space, so it has a DESC in it for descending sorting
            else if (propertyName.Contains(' '))
            {
                // get the property name
                string prop = propertyName.Substring(0, propertyName.IndexOf(' '));

                return PlantBLL.GetAll(prop, false);
            }
            // just the property name it is for ascending
            else
            {
                return PlantBLL.GetAll(propertyName, true);
            }
        }
        #endregion

        #region Modify Methods
        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Plant newPlant)
        {
            newPlant.DateEntered = DateTime.Now;
            newPlant.ReCallusingAssay = false;
            newPlant.Rooting = false;

            // auto generate the sequence number
            newPlant.SequenceNumber = (newPlant.Experiment.Plants.Count + 1).ToString("000");

            // assign the default status
            newPlant.Status = StatusBLL.GetByName(StatusText.STR_Initiated);

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newPlant);

                ts.CommittTransaction(); //commit the transaction
            }

            NHibernateSessionManager.Instance.EvictObject(newPlant.Experiment);
            NHibernateSessionManager.Instance.EvictObject(newPlant);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(Plant plant)
        {
            if (plant.Experiment.Construct.IsLocked)
            {
                throw (MessageException) new Exception("Construct (" + plant.Experiment.Construct.ConstructCode + ") has been locked and cannot be changed.");
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref plant);

                ts.CommittTransaction();
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void ChangeStatus(Plant plant, Status status)
        {
            // if it's shipped we need to mark the ship date
            if (status.Name == StatusText.STR_Shipped)
            {
                plant.DateDelivered = DateTime.Now;
            }
            else
            {
                plant.DateDelivered = null;
            }

            plant.Status = status;

            PlantBLL.Update(plant);

            // update the construct
            ConstructBLL.UpdateStatus(plant.Experiment.Construct);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void ChangeRecallusingAssay(Plant plant, bool recallusing)
        {
            plant.ReCallusingAssay = recallusing;

            PlantBLL.Update(plant);
        }

        [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
        [PrincipalPermission(SecurityAction.Demand, Role = "User")]
        public static void ChangeRooting(Plant plant, bool rooting)
        {
            plant.Rooting = rooting;

            PlantBLL.Update(plant);
        }
        #endregion
    }
}

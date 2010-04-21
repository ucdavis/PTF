﻿using System;
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

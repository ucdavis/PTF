﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class PlantBLL : GenericBLL<Plant, int>
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Plant newPlant)
        {
            newPlant.DateEntered = DateTime.Now;
            newPlant.ReCallusingAssay = false;
            newPlant.Rooting = false;

            // auto generate the sequence number
            newPlant.SequenceNumber = (newPlant.Experiment.Plants.Count + 1).ToString("000");

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newPlant);

                ts.CommittTransaction(); //commit the transaction
            }
        }
    }
}
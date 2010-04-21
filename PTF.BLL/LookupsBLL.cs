using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;
using System.ComponentModel;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class NoteTypeBLL : GenericBLL<NoteType, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            NoteType noteType = new NoteType() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref noteType);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    [DataObject]
    public class CropBLL : GenericBLL<Crop, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            Crop crop = new Crop() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref crop);

                ts.CommittTransaction();    // commit the transaction
            }
        }
    }
    [DataObject]
    public class AgroStrainBLL : GenericBLL<AgroStrain, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            AgroStrain agroStrain = new AgroStrain() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref agroStrain);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    [DataObject]
    public class StatusBLL : GenericBLL<Status, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            Status status = new Status() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref status);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    [DataObject]
    public class SelectableMarkerBLL : GenericBLL<SelectableMarker, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            SelectableMarker selectableMarker = new SelectableMarker() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref selectableMarker);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    [DataObject]
    public class GenoTypeBLL : GenericBLL<GenoType, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            GenoType genoType = new GenoType() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref genoType);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    [DataObject]
    public class TransGeneBLL : GenericBLL<TransGene, int> 
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Save(string name)
        {
            TransGene transGene = new TransGene() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref transGene);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
}

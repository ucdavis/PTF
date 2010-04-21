using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    public class NoteTypeBLL : GenericBLL<NoteType, int> 
    {
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
    public class CropBLL : GenericBLL<Crop, int> 
    {
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
    public class AgroStrainBLL : GenericBLL<AgroStrain, int> 
    {
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
    public class StatusBLL : GenericBLL<Status, int> 
    {
        public static void Save(string name)
        {
            Status status = new NoteType() { Name = name };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref status);

                ts.CommittTransaction();    // committ the transaction
            }
        }
    }
    public class SelectableMarkerBLL : GenericBLL<SelectableMarker, int> 
    {
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
    public class GenoTypeBLL : GenericBLL<GenoType, int> 
    {
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
    public class TransGeneBLL : GenericBLL<TransGene, int> 
    {
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

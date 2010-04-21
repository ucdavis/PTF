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
    public class LookupBLLBase<T, IdT> : GenericBLL<T, IdT> where T : LookupBase<T, IdT>, new()
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<T> GetActive()
        {
            var obj = new T();
            obj.IsActive = true;

            return LookupBLLBase<T, IdT>.GetByInclusionExample(obj, "Name", true, "IsActive" );
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(T obj)
        {
            obj.IsActive = true;    // This value needs to be set to true by default

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction(); //commit the transaction
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static void Update(T obj)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static void Delete(T obj)
        {
            obj.IsActive = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref obj);

                ts.CommittTransaction();
            }
        }
    }

    [DataObject]
    public class NoteTypeBLL : LookupBLLBase<NoteType, int> {}
    [DataObject]
    public class CropBLL : LookupBLLBase<Crop, int> { }

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

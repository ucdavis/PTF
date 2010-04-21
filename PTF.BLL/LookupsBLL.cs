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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static T GetByName(string name)
        {
            var obj = new T();
            obj.Name = name;

            List<T> results = LookupBLLBase<T, IdT>.GetByInclusionExample(obj, "Name");

            if (results.Count() > 0) // check if there were results
            {
                return results[0];  // return the first result
            }
            else
            {
                return null;    // return nothing, no match on the name
            }
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
            var deleteObj = LookupBLLBase<T, IdT>.GetByID(obj.ID);

            deleteObj.IsActive = false;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref deleteObj);

                ts.CommittTransaction();
            }
        }
    }

    [DataObject]
    public class NoteTypeBLL : LookupBLLBase<NoteType, int> {}
    [DataObject]
    public class CropBLL : LookupBLLBase<Crop, int> { }
    [DataObject]
    public class AgroStrainBLL : LookupBLLBase<AgroStrain, int> { }
    [DataObject]
    public class StatusBLL : LookupBLLBase<Status, int> 
    { 
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Status> GetPlantStatus()
        {
            Status status = new Status()
            {
                IsPlant = true,
                IsActive = true
            };

            return StatusBLL.GetByInclusionExample(status, "IsPlant", "IsActive");
        }
    }
    [DataObject]
    public class PlantSelectionBLL : LookupBLLBase<PlantSelection, int> { }
    [DataObject]
    public class GenoTypeBLL : LookupBLLBase<GenoType, int> { }
    [DataObject]
    public class TransGeneBLL : LookupBLLBase<TransGene, int> { }
    [DataObject]
    public class CountryBLL : LookupBLLBase<Country, string> { }
    [DataObject]
    public class StateBLL : LookupBLLBase<State, string> { }
}

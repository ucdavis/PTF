using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class LookupBase<T, IdT> : DomainObject<T, IdT> 
    {
        public LookupBase() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }

        [NotNullValidator]
        public virtual bool IsActive { get; set; }

        public virtual IdT Identifier
        {
            get { return id; }
            set { id = value; }
        }
    }

    public class NoteType : LookupBase<NoteType, int> { }
    public class Crop : LookupBase<Crop, int> {
        public virtual IList<PlantSelection> PlantSelections { get; set; }
        public virtual IList<GenoType> GenoTypes { get; set; }
        public virtual int IncrementSize { get; set; }
        public virtual float Price { get; set; }
    }
    public class AgroStrain : LookupBase<AgroStrain, int> { }
    public class Status : LookupBase<Status, int> {
        public virtual bool IsComplete { get; set; }
        public virtual bool IsPlant { get; set; }
    }
    public class PlantSelection : LookupBase<PlantSelection, int> { }
    public class GenoType : LookupBase<GenoType, int> { }
    public class TransGene : LookupBase<TransGene, int> { }
    public class Country : LookupBase<Country, string> { }
    public class State : LookupBase<State, string> { }
}

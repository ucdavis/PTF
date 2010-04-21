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

    //public class NoteType : DomainObject<NoteType, int>
    //{
    //    public NoteType() { }

    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class Crop : DomainObject<Crop, int>
    //{
    //    public Crop() { }
        
    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class AgroStrain : DomainObject<AgroStrain, int>
    //{
    //    public AgroStrain() { }

    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class Status : DomainObject<Status, int>
    //{
    //    public Status() { }

    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class SelectableMarker : DomainObject<SelectableMarker, int>
    //{
    //    public SelectableMarker() { }
        
    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class GenoType : DomainObject<GenoType, int>
    //{
    //    public GenoType() { }

    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    //public class TransGene : DomainObject<TransGene, int>
    //{
    //    public TransGene() { }

    //    [NotNullValidator]
    //    [StringLengthValidator(50)]
    //    public virtual string Name { get; set; }
    //}

    public class NoteType : LookupBase<NoteType, int> { }
    public class Crop : LookupBase<Crop, int> {
        public virtual IList<PlantSelection> PlantSelections { get; set; }
        public virtual IList<GenoType> GenoTypes { get; set; }
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

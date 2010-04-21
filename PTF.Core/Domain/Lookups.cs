using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class NoteType : DomainObject<NoteType, int>
    {
        public NoteType() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class Crop : DomainObject<Crop, int>
    {
        public Crop() { }
        
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class AgroStrain : DomainObject<AgroStrain, int>
    {
        public AgroStrain() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class Status : DomainObject<Status, int>
    {
        public Status() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class SelectableMarker : DomainObject<SelectableMarker, int>
    {
        public SelectableMarker() { }
        
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class GenoType : DomainObject<GenoType, int>
    {
        public GenoType() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }

    public class TransGene : DomainObject<TransGene, int>
    {
        public TransGene() { }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Name { get; set; }
    }
}

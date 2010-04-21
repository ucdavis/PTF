using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Plant : DomainObject<Plant, int>
    {
        public Plant() { }

        public virtual string Pedigree { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(15)]
        public virtual string SequenceNumber { get; set; }
        public virtual Experiment Experiment { get; set; }
        [NotNullValidator]
        public virtual DateTime DateEntered { get; set; }
        [NotNullValidator]
        public virtual bool ReCallusingAssay { get; set; }
        [NotNullValidator]
        public virtual bool Rooting { get; set; }
        [IgnoreNulls]
        public virtual string Comment { get; set; }
        [IgnoreNulls]
        public virtual DateTime? DateDelivered { get; set; }
    }
}

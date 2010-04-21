using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Experiment : DomainObject<Experiment, int>
    {
        public virtual string ExperimentCode { get; set; }
        public virtual DateTime? DateStarted { get; set; }
        public virtual Operator Operator { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(15)]
        public virtual string SeedLotNumber { get; set; }
        public virtual Construct Construct { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string AgroSelection { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Explant { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Trait { get; set; }
        public virtual string Comments { get; set; }
        public virtual int? TargetNumPlants { get; set; }
        public virtual float OpticalDensity { get; set; }
    }
}

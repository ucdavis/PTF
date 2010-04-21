using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Construct : DomainObject<Construct, int>
    {
        public virtual string ConstructCode { get; set; }
        [NotNullValidator]
        public virtual DateTime DateCreated { get; set; }
        public virtual Order Order { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(10)]
        public virtual string PlantsRequested { get; set; }
        public virtual int PlantsDelivered { get; set; }
        public virtual DateTime? TransformationInitiated { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string PIConstructName { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string PICode { get; set; }
        public virtual AgroStrain AgroStrain { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string BacterialSelection { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Plasmid { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string Trait { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(200)]
        public virtual string GeneOfInterest { get; set; }
        public virtual SelectableMarker SelectableMarker { get; set; }
        public virtual int? ArchivedBox { get; set; }
        public virtual int? Position { get; set; }
        public virtual int? WorkingBox { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Location { get; set; }
        public virtual Crop Crop { get; set; }
        public virtual GenoType Genotype { get; set; }
        public virtual string Comments { get; set; }
        public virtual Status Status { get; set; }
        public virtual DateTime DateReceived { get; set; }
        public virtual DateTime? InvoiceDate { get; set; }
        public virtual decimal RechargeAmount { get; set; }
        public virtual bool ContractExecuted { get; set; }  

        public virtual IList<Experiment> Experiments { get; set; }
    }
}

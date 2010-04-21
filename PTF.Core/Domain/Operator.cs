using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Operator : DomainObject<Operator, int>
    {
        [NotNullValidator]
        [StringLengthValidator(100)]
        public virtual string OperatorName { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(5)]
        public virtual string OperatorCode { get; set; }
        [NotNullValidator]
        public virtual bool IsStudent { get; set; }
        [NotNullValidator]
        public virtual bool IsSelectable { get; set; }
        public virtual int EffectiveID { get; set; }

        public virtual int Identifier
        {
            get { return id; }
            set { id = value; }
        }
    }
}

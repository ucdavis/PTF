using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class UserProfile : DomainObject<UserProfile, int>
    {
        public virtual Guid UserID { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string Address1 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string Address2 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string City { get; set; }
        public virtual State State { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string InternationalState { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(12)]
        public virtual string Zip { get; set; }
        public virtual Country Country { get; set; }
    }
}

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
        public virtual SubOrder SubOrder { get; set; }

        public virtual int PlantsDelivered { get; set; }
        public virtual DateTime? TransformationInitiated { get; set; }

        public virtual string Comments { get; set; }
        public virtual DateTime? InvoiceDate { get; set; }
        public virtual decimal RechargeAmount { get; set; }

        public virtual Status Status { get; set; }

        public virtual IList<Experiment> Experiments { get; set; }

        public virtual bool IsLocked { get; set; }

        public virtual bool IsBilled
        {
            get
            {
                if (InvoiceDate != null && Status.Name == StatusText.STR_Complete)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}

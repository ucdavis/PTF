using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Order : DomainObject<Order, int>
    {
        [NotNullValidator]
        public virtual DateTime DateRequested { get; set; }
        [NotNullValidator]
        [StringLengthValidator(100)]
        public virtual string PI { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string Contact { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(20)]
        public virtual string ContactPhone { get; set; }
        [StringLengthValidator(50)]
        [NotNullValidator]
        public virtual string ContactEmail { get; set; }

        [NotNullValidator]
        [StringLengthValidator(100)]
        public virtual string MailingAddress1 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string MailingAddress2 { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string MailingCity { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string MailingInternationalState { get; set; }
        public virtual State MailingState { get; set; }
        [NotNullValidator]
        [StringLengthValidator(12)]
        public virtual string MailingZip { get; set; }
        [NotNullValidator]
        public virtual Country MailingCountry { get; set; }

        [NotNullValidator]
        [StringLengthValidator(100)]
        public virtual string ShippingAddress1 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string ShippingAddress2 { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string ShippingCity { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ShippingInternationalState { get; set; }
        public virtual State ShippingState { get; set; }
        [NotNullValidator]
        [StringLengthValidator(12)]
        public virtual string ShippingZip { get; set; }
        [NotNullValidator]
        public virtual Country ShippingCountry { get; set; }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string Plasmid { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string BacterialSelection { get; set; }
        [NotNullValidator]
        public virtual AgroStrain AgroStrain { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string PIConstructName { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string PICode { get; set; }
        public virtual TransGene TransGene { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Trait { get; set; }

        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string SelectableMarkerPromoter { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string SelectableMarkerGene { get; set; }

        [IgnoreNulls]
        public virtual string AdditionalInformation { get; set; }
        [NotNullValidator]
        public virtual bool OtherUCResearch { get; set; }
        [NotNullValidator]
        public virtual Guid UserID { get; set; }
        
        [IgnoreNulls]
        [StringLengthValidator(20)]
        public virtual string RechargeNumber { get; set; }
        [IgnoreNulls]
        public virtual bool ContractExecuted { get; set; }
        //[RegexValidator("^\d{2}-\d{3}-\d{3}[nm]$")]
        [IgnoreNulls]
        public virtual string ShippingPermit { get; set; }
        public virtual string Comments { get; set; }
        [IgnoreNulls]
        public virtual DateTime? DateReceived { get; set; }

        [IgnoreNulls]
        [StringLengthValidator(10)]
        public virtual string ArchiveBox { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(10)]
        public virtual string Position { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(10)]
        public virtual string WorkingBox { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(10)]
        public virtual string Location { get; set; }

        public virtual IList<Construct> Constructs { get; set; }
        public virtual IList<SubOrder> SubOrders { get; set; }

        /// <summary>
        /// Determines whether a contract is needed, based on whether or not a recharge number is provided.
        /// </summary>
        public virtual bool RequiresContract {
            get
            {
                if (RechargeNumber == null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        /// <summary>
        /// Determines whether a shipping permit is required, based on shipping address, country and state.
        /// </summary>
        public virtual bool RequiresShippingPermit {
            get
            {
                if (ShippingCountry.ID == "USA" && ShippingState.ID != "CA")
                {
                    return true;
                }
                else if (ShippingCountry.ID != "USA")
                {
                    return true;
                }
                else
                {   // this should be USA inside california
                    return false;
                }
            }
        }
    }
}

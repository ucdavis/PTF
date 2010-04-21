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
        //[RegexValidator("([\(]?(?<AreaCode>[0-9]{3})[\)]?)?[ \.\-]?(?<Exchange>[0-9]{3})[ \.\-](?<Number>[0-9]{4})")]
        public virtual string ContactPhone { get; set; }
        [StringLengthValidator(50)]
        [NotNullValidator]
        //[RegexValidator("^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.(af|ax|al|dz|as|ad|ao|ai|aq|ag|ar|am|aw|au|at|az|bs|bh|bd|bb|by|be|bz|bj|bm|bt|bo|ba|bw|bv|br|io|bn|bg|bf|bi|kh|cm|ca|cv|ky|cf|td|cl|cn|cx|cc|co|km|cg|cd|ck|cr|ci|hr|cu|cy|cz|dk|dj|dm|do|ec|eg|sv|gq|er|ee|et|fk|fo|fj|fi|fr|gf|pf|tf|ga|gm|ge|de|gh|gi|gr|gl|gd|gp|gu|gt| gg|gn|gw|gy|ht|hm|va|hn|hk|hu|is|in|id|ir|iq|ie|im|il|it|jm|jp|je|jo|kz|ke|ki|kp|kr|kw|kg|la|lv|lb|ls|lr|ly|li|lt|lu|mo|mk|mg|mw|my|mv|ml|mt|mh|mq|mr|mu|yt|mx|fm|md|mc|mn|ms|ma|mz|mm|na|nr|np|nl|an|nc|nz|ni|ne|ng|nu|nf|mp|no|om|pk|pw|ps|pa|pg|py|pe|ph|pn|pl|pt|pr|qa|re|ro|ru|rw|sh|kn|lc|pm|vc|ws|sm|st|sa|sn|cs|sc|sl|sg|sk|si|sb|so|za|gs|es|lk|sd|sr|sj|sz|se|ch|sy|tw|tj|tz|th|tl|tg|tk|to|tt|tn|tr|tm|tc|tv|ug|ua|ae|gb|us|um|uy|uz|vu|ve|vn|vg|vi|wf|eh|ye|zm|zw|com|edu|gov|int|mil|net|org|biz|info|name|pro|aero|coop|museum|arpa))|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$")]
        public virtual string ContactEmail { get; set; }

        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string MailingAddress1 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string MailingAddress2 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string MailingCity { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string MailingInternationalState { get; set; }
        public virtual State MailingState { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(12)]
        public virtual string MailingZip { get; set; }
        public virtual Country MailingCountry { get; set; }

        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string ShippingAddress1 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(100)]
        public virtual string ShippingAddress2 { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ShippingCity { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ShippingInternationalState { get; set; }
        public virtual State ShippingState { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(12)]
        public virtual string ShippingZip { get; set; }
        public virtual Country ShippingCountry { get; set; }
        
        
        public virtual Crop Crop { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Cultivar { get; set; }
        [IgnoreNulls]
        [RangeValidator(0, RangeBoundaryType.Exclusive, 99999, RangeBoundaryType.Inclusive)]
        public virtual int? NumberOfPlants { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Plasmid { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string BacterialSelection { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string AgroBacteriumStrain { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string PlantSelection { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Construct { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string NameOfYourConstruct { get; set; }
        public virtual TransGene TransGene { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string GeneOfInterestPromoter { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string GeneOfInterestGene { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string GeneOfInterestTerminator { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string SelectableMarkerPromoter { get; set; }
        [NotNullValidator]
        [StringLengthValidator(50)]
        public virtual string SelectableMarkerGene { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string SelectableMarkerTerminator { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ScorableMarkerPromoter { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ScorableMarkerGene { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ScorableMarkerTerminator { get; set; }
        public virtual string AdditionalInformation { get; set; }
        [IgnoreNulls]
        [NotNullValidator]
        public virtual Guid UserID { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(20)]
        public virtual string RechargeNumber { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string ContractNumber { get; set; }
        //[RegexValidator("^\d{2}-\d{3}-\d{3}[nm]$")]
        public virtual string ShippingPermit { get; set; }
        [NotNullValidator]
        public virtual bool OtherUCResearch { get; set; }

        public virtual IList<Construct> Constructs { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class ArchivedConstruct : DomainObject<ArchivedConstruct, string>
    {
        public virtual string NumPlantsRequested { get; set; }
        public virtual string NumPlantsDelivered { get; set; }
        public virtual string TransformationInitiated { get; set; }
        public virtual string PIConstructName { get; set; }
        public virtual string AgroStrains { get; set; }
        public virtual string PICode { get; set; }
        public virtual string BacterialSelection { get; set; }
        public virtual string Plasmid { get; set; }
        public virtual string Trait { get; set; }
        public virtual string GeneOfInterest { get; set; }
        public virtual string PlantSelection { get; set; }
        public virtual string PI { get; set; }
        public virtual string Client { get; set; }
        public virtual int ArchivedBox { get; set; }
        public virtual int Position { get; set; }
        public virtual int WorkingBox { get; set; }
        public virtual string Location { get; set; }
        public virtual string TargetCrop { get; set; }
        public virtual string Cultivar { get; set; }
        public virtual string AvailableForUCResearch { get; set; }
        public virtual string Comment { get; set; }
        public virtual string RechargeNumber { get; set; }
        public virtual string RechargeAmount { get; set; }
        public virtual string ContractExecuted { get; set; }
        public virtual string Status { get; set; }
        public virtual string InvoiceSent { get; set; }
        public virtual string DateReceived { get; set; }
    }
}

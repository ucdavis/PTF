using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class ArchivedPlantInventory : DomainObject<ArchivedPlantInventory, string>
    {
        public virtual int TransformationCode { get; set; }
        public virtual string Crop { get; set; }
        public virtual DateTime? DateInitiated { get; set; }
        public virtual DateTime? DateEntered { get; set; }
        public virtual string Genotype { get; set; }
        public virtual string PI { get; set; }
        public virtual string Client { get; set; }
        public virtual string NumPlantsRequested { get; set; }
        public virtual string AgroStrains { get; set; }
        public virtual string ConstructCode { get; set; }
        public virtual string PIConstructCode { get; set; }
        public virtual string GeneOfInterest { get; set; }
        public virtual string Selection { get; set; }
        public virtual string Plasmid { get; set; }
        public virtual string Trait { get; set; }
        public virtual string ReCallusingAssay { get; set; }
        public virtual string Rooting { get; set; }
        public virtual string Comment { get; set; }
        public virtual string DateDelivered { get; set; }
    }
}

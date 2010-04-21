using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class ArchivedExperiment : DomainObject<ArchivedExperiment, int>
    {
        public virtual string Date { get; set; }
        public virtual string PI { get; set; }
        public virtual string Client { get; set; }
        public virtual string Operator { get; set; }
        public virtual string CropSpecies { get; set; }
        public virtual string Cultivar { get; set; }
        public virtual string SeedLotNumber { get; set; }
        public virtual string AgroStrain { get; set; }
        public virtual string AgroCode { get; set; }
        public virtual string AgroSelection { get; set; }
        public virtual string PlantSelection { get; set; }
        public virtual string Explant { get; set; }
        public virtual string Precondition { get; set; }
        public virtual string CoCulture { get; set; }
        public virtual string Induction { get; set; }
        public virtual string InductionII { get; set; }
        public virtual string InductionIII { get; set; }
        public virtual string ElongationGermination { get; set; }
        public virtual string Recallusing { get; set; }
        public virtual string Rooting { get; set; }
        public virtual string Trait { get; set; }
        public virtual string Comment { get; set; }
        public virtual string InvoiceSent { get; set; }
        public virtual int TargetedNumPlants { get; set; }
        public virtual float OpticalDensity { get; set; }


      ,[Agro Code]
      ,[PI Construct Code]
      ,[Plasmid]
      ,[Agro Selection]
      ,[Plant Selection]
      ,[Explant]
      ,[Precondition]
      ,[Co-Culture]
      ,[Induction]
      ,[Induction II]
      ,[Induction III]
      ,[Elongation/Germination]
      ,[Recallusing]
      ,[Rooting]
      ,[Trait]
      ,[Comment]
      ,[Invoice Sent]
      ,[Targeted # of Plants]
      ,[Optical Density]
    }
}

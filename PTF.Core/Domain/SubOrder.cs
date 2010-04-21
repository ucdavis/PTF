using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class SubOrder : DomainObject<SubOrder, int>
    {
        public virtual Order Order { get; set; }
        public virtual int NumberOfPlants { get; set; }
        public virtual Crop Crop { get; set; }
        public virtual PlantSelection PlantSelection { get; set; }
        public virtual GenoType GenoType { get; set; }

        public virtual IList<Construct> Constructs { get; set; }
    }
}

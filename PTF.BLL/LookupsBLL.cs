using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;

namespace CAESDO.PTF.BLL
{
    public class NoteTypeBLL : GenericBLL<NoteType, int> { }
    public class CropBLL : GenericBLL<Crop, int> { }
    public class AgroStrainBLL : GenericBLL<AgroStrain, int> { }
    public class StatusBLL : GenericBLL<Status, int> { }
    public class SelectableMarkerBLL : GenericBLL<SelectableMarker, int> { }
    public class GenoTypeBLL : GenericBLL<GenoType, int> { }
    public class TransGeneBLL : GenericBLL<TransGene, int> { }
}

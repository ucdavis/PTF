using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public interface ITrackable
    {
        bool isTracked();

        bool arePropertiesTracked();
    }
}

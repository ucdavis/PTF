using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.NHibernatev2.Core.Domain
{
    public interface ITrackable
    {
        bool isTracked();

        bool arePropertiesTracked();
    }
}

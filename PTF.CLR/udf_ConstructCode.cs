using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString udf_ConstructCode(int yearCode, int sequenceNumber, int subSequenceNumber)
    {
        string constructCode = "AT";

        if (yearCode < 10)
        {
            constructCode += "0" + yearCode.ToString();
        }
        else
        {
            constructCode += yearCode.ToString();
        }

        if (sequenceNumber < 10)
        {
            constructCode += "00" + sequenceNumber.ToString();
        }
        else if (sequenceNumber >= 10 && sequenceNumber < 100)
        {
            constructCode += "0" + sequenceNumber.ToString();
        }
        else
        {
            constructCode += sequenceNumber.ToString();
        }

        if (subSequenceNumber > 0)
        {
            constructCode += "-";

            if (subSequenceNumber < 10)
            {
                constructCode += "0" + subSequenceNumber.ToString();
            }
            else
            {
                constructCode += subSequenceNumber.ToString();
            }
        }

        return new SqlString(constructCode);
    }
};


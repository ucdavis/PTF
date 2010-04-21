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

        constructCode += yearCode.ToString("d2");

        constructCode += sequenceNumber.ToString("d3");

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


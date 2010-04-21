using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString udf_ConstructCode(int yearCode, int sequenceNumber, int subSequenceNumber)
    {
        StringBuilder constructCode = new StringBuilder("AT");
        constructCode.Append(yearCode.ToString("d2"));
        constructCode.Append(sequenceNumber.ToString("d3"));

        //string constructCode = "AT";

        //constructCode += yearCode.ToString("d2");

        //constructCode += sequenceNumber.ToString("d3");

        if (subSequenceNumber > 0)
        {
            //constructCode += "-";
            constructCode.Append("-");
            constructCode.Append(subSequenceNumber.ToString("d2"));

            //if (subSequenceNumber < 10)
            //{
            //    constructCode += "0" + subSequenceNumber.ToString();
            //}
            //else
            //{
            //    constructCode += subSequenceNumber.ToString();
            //}
        }

        return new SqlString(constructCode.ToString());
    }
};


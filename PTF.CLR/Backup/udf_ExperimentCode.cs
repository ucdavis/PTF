using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString udf_ExperimentCode(string yearCode, string operatorCode, string operatorExperimentNum)
    {
        int year, opCode, experimentNum;

        if (!int.TryParse(yearCode, out year) || !int.TryParse(operatorCode, out opCode) || !int.TryParse(operatorExperimentNum, out experimentNum))
        {
            return "n/a";
        }

        StringBuilder experimentCode = new StringBuilder();

        experimentCode.Append(year.ToString("d2"));
        experimentCode.Append(opCode.ToString());
        experimentCode.Append(experimentNum.ToString("d3"));

        return (SqlString)experimentCode.ToString();
    }
};


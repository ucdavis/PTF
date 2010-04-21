using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString udf_ExperimentCode(int yearCode, int operatorCode, int operatorExperimentNum)
    {
        string experimentCode;

        experimentCode = yearCode.ToString();
        experimentCode += operatorCode.ToString();
        if (operatorExperimentNum < 10)
        {
            experimentCode += "00" + operatorExperimentNum.ToString();
        }
        else if (operatorExperimentNum < 100)
        {
            experimentCode += "0" + operatorExperimentNum.ToString();
        }
        else
        {
            experimentCode += operatorExperimentNum.ToString();
        }

        return (SqlString)experimentCode;
    }
};


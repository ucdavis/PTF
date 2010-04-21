using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlDateTime ConvertDateTime(string date)
    {
        if (string.IsNullOrEmpty(date))
            return new SqlDateTime(1900, 1, 1);

        try
        {
            return (SqlDateTime)Convert.ToDateTime(date);
        }
        catch
        {
            return new SqlDateTime(1900, 1, 1);
        }
    }
};


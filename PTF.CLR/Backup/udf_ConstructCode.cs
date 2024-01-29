using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString udf_ConstructCode(string yearCode, string sequenceNumber, string subSequenceNumber)
    {
        int year, sequence, subSequence;

        if (!int.TryParse(yearCode, out year) || !int.TryParse(sequenceNumber, out sequence) || !int.TryParse(subSequenceNumber, out subSequence))
        {
            return "n/a";
        }

        StringBuilder constructCode = new StringBuilder("AT");
        constructCode.Append(year.ToString("d2"));
        constructCode.Append(sequence.ToString("d3"));

        if (subSequence > 0)
        {
            constructCode.Append("-");
            constructCode.Append(subSequence.ToString("d2"));
        }

        return new SqlString(constructCode.ToString());
    }
};


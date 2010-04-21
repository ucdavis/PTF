using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for PTFConfiguration
/// </summary>
public static class PTFConfiguration
{
    /// <summary>
    /// Hold the type of errors that can occur in the system.  For use in the ErrorPage and ErrorMessage functions
    /// </summary>
    public enum ErrorType
    {
        DATA, AUTH, MAIL, SESSION, FILE, QUERY, VALIDATION, UNKNOWN
    }

    /// <summary>
    /// Name of the error page (could be read from the web.config in a future version)
    /// </summary>
    private static string ErrorPageName = "~/Error.aspx";

    /// <summary>
    /// Returns the name of the page to redirect the user to for the specified error
    /// </summary>
    /// <param name="errorName">Error Name</param>
    /// <returns>String</returns>
    public static string ErrorPage(ErrorType error)
    {
        if (error == ErrorType.DATA)
            return ErrorPageName + "?reason=data";
        else if (error == ErrorType.AUTH)
            return ErrorPageName + "?reason=auth";
        else if (error == ErrorType.SESSION)
            return ErrorPageName + "?reason=session";
        else if (error == ErrorType.FILE)
            return ErrorPageName + "?reason=file";
        else if (error == ErrorType.QUERY)
            return ErrorPageName + "?reason=query";
        else if (error == ErrorType.VALIDATION)
            return ErrorPageName + "?reason=validation";
        else
            return ErrorPageName + "?reason=unknown";
    }

    /// <summary>
    /// Returns the friendly error message from a given reason
    /// </summary>
    /// <param name="reason">ErrorType enum of from the AD419Configuration class</param>
    /// <returns>string</returns>
    public static string ErrorMessage(PTFConfiguration.ErrorType error)
    {
        if (error == ErrorType.AUTH)
            return "Authentication Error";
        else if (error == ErrorType.DATA)
            return "Data Access Error";
        else if (error == ErrorType.SESSION)
            return "Session Expiration Error";
        else if (error == ErrorType.FILE)
            return "File Not Found Error";
        else if (error == ErrorType.QUERY)
            return "Query String Error";
        else if (error == ErrorType.VALIDATION)
            return "Object Validation Error";
        else
            return "Unknown Error";
    }

    /// <summary>
    /// Returns the friendly error message from a given reason
    /// </summary>
    /// <param name="reason">The short reason</param>
    /// <returns>string</returns>
    public static string ErrorMessage(string reason)
    {
        if (reason == null || reason == "unknown")
            return "Unknown Error";
        else if (reason == "data")
            return "Data Access Error";
        else if (reason == "auth")
            return "Authentication Error";
        else if (reason == "querystring")
            return "Invalid Selection";
        else if (reason == "session")
            return "Session Expiration";
        else if (reason == "file")
            return "File Not Found Exception";
        else if (reason == "query")
            return "Query String Not Valid";
        else if (reason == "validation")
            return "Object Validation Error";
        else if (reason == "mail")
            return "Email Send Error-- Could Not Reach All Recipients";
        else
            return "Unknown Error";
    }
}

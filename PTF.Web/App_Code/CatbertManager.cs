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
using System.ComponentModel;
using System.Net;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.BLL;

/// <summary>
/// Summary description for CatbertManager
/// </summary>
[DataObject]
public class CatbertManager
{
    static readonly string AppName = ConfigurationManager.AppSettings["AppName"];

    public static string HASH = "";

    public static CatOps.CatbertWebService catops = new CatOps.CatbertWebService();

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static CatOps.Units[] GetUnits()
    {
        SetSecurityContext();

        return catops.GetUnits();
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static CatOps.Roles[] GetRoles()
    {
        SetSecurityContext();

        return catops.GetRoles(AppName);
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static CatOps.Users[] SearchNewUsersByLogin(string EmployeeID, string FirstName, string LastName, string LoginID)
    {
        SetSecurityContext();

        return catops.SearchNewUser(EmployeeID, FirstName, LastName, LoginID);
    }

    public static CatOps.Users[] SearchCampusUser(string loginID)
    {
        SetSecurityContext();

        return catops.SearchNewUser(null, null, null, loginID);
        //return catops.SearchCampusNewUser(loginID, HASH);
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static CatOps.Users[] SearchNewUsersByLogin(string login)
    {
        SetSecurityContext();

        return catops.SearchNewUser(null, null, null, login);
    }

    public static bool AddUserToRole(CatOps.Users user, CatOps.Roles role)
    {
        SetSecurityContext();

        return catops.AssignPermissions(user.Login, AppName, role.RoleID);
    }

    public static bool AddUserToRole(string login, int roleID)
    {
        SetSecurityContext();

        return catops.AssignPermissions(login, AppName, roleID);
    }

    public static bool RemoveUserFromRole(int roleID, string login)
    {
        SetSecurityContext();

        return catops.DeletePermissions(login, AppName, roleID);
    }

    public static bool AddUserToUnit(string login, int UnitID)
    {
        SetSecurityContext();

        return catops.AddUnit(login, UnitID);
    }

    public static bool RemoveUserFromUnit(string login, int UnitID)
    {
        SetSecurityContext();

        return catops.DeleteUnit(login, UnitID);
    }

    public static CatOps.Roles[] GetRolesByUser(string login)
    {
        SetSecurityContext();

        return catops.GetRolesByUser(AppName, login);
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static CatOps.CatbertUsers[] GetUsersInApplication()
    {
        SetSecurityContext();

        return catops.GetUsersByApplications(AppName);
    }

    public static int InsertNewUser(string login)
    {
        SetSecurityContext();

        CatOps.Users[] newUsers = CatbertManager.SearchNewUsersByLogin(login);
        if (newUsers.Length != 1)
            return -1;

        return catops.InsertNewUser(newUsers[0]);
    }

    public static int InsertNewUser(CatOps.Users user)
    {
        SetSecurityContext();

        return catops.InsertNewUser(user);
    }

    public static bool VerifyUser(string login)
    {
        SetSecurityContext();

        return catops.VerifyUser(login);
    }

    public CatbertManager()
    {

    }

    public static void SetSecurityContext()
    {
        CatOps.SecurityContext sc = new CatOps.SecurityContext();

        string username = HttpContext.Current.User.Identity.Name;

        User user = UserBLL.GetCurrent();

        sc.userID = username;
        sc.password = user.UserKey.ToString();

        System.Net.ServicePointManager.CertificatePolicy = new TrustAllCertificatePolicy();

        catops.SecurityContextValue = sc;
    }
}

// Accept all certificates even self signed
public class TrustAllCertificatePolicy : System.Net.ICertificatePolicy
{
    public TrustAllCertificatePolicy()
    { }

    public bool CheckValidationResult(ServicePoint sp,
     System.Security.Cryptography.X509Certificates.X509Certificate cert, WebRequest req, int problem)
    {
        return true;
    }
}

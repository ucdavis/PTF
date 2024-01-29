using System;
using System.Web.Security;
using System.Web.UI.WebControls;
using CAESDO.PTF.BLL;

public partial class admin_ClientManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbReset_OnCommand(object sender, CommandEventArgs e)
    {
        Guid key = new Guid(e.CommandArgument.ToString());

        var u = Membership.GetUser(key);

        // generate the new password
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);

        var user = Membership.Providers["AspNetSqlMembershipProviderOther"].GetUser(u.UserName, false);
        //user.ChangePassword(user.ResetPassword(), )

        var password = user.ResetPassword();

        EmailBLL.ResetPasswordEmail(key, password);

        Response.Write("Password for user " + user.UserName + " has been reset.");
    }

    protected void lbUnlock_OnCommand(object sender, CommandEventArgs e)
    {
        Guid key = new Guid(e.CommandArgument.ToString());

        var user = Membership.GetUser(key);
        user.UnlockUser();

        Response.Write("User " + user.UserName + " has been unlocked.");
    }
}

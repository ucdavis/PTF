using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CAESDO.PTF.BLL;

public partial class admin_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbReset_Command(object sender, CommandEventArgs e)
    {
        Guid key = new Guid(e.CommandArgument.ToString());

        var user = Membership.GetUser(key);
        var newPassword = user.ResetPassword();

        EmailBLL.ResetPasswordEmail(key, newPassword);
    }
    protected void lbUnlock_Command(object sender, CommandEventArgs e)
    {
        Guid key = new Guid(e.CommandArgument.ToString());

        var user = Membership.GetUser(key);
        user.UnlockUser();

        gvClients.DataBind();
    }
}

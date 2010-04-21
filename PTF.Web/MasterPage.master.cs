using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected string STR_RedirectAddress
    {
        get 
        { 
            var request = HttpContext.Current.Request;

            return request.Url.GetLeftPart(UriPartial.Authority) + request.Url.Segments[0] + request.Url.Segments[1];
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        litVersion.Text = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        var user = Membership.GetUser();

        if (user == null) // cas login, redirect to the cas logout page
        {
            FormsAuthentication.SignOut();
            
            Response.Redirect("https://cas.ucdavis.edu/cas/logout?service=" + STR_RedirectAddress, true);
        }
        else
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx", true);
        }
    }
}

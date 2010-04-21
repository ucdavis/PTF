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
    private bool IsEmulating
    {
        get { return Session["Emulating"] == null ? false : (bool)Session["Emulating"]; }
        set { Session["Emulating"] = value; }
    }
    private bool IsCasUser
    {
        get { return Session["CasUser"] == null ? false : (bool)Session["CasUser"]; }
        set { Session["CasUser"] = value; }
    }

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
        if (IsEmulating)
        {
            Response.Write("You are currently in emulation mode.");
        }

        litVersion.Text = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        var user = Membership.GetUser();

        if (user == null)
        {
            IsCasUser = true;
        }

        //var user = Membership.GetUser();

        //if (IsEmulating)
        //{
        //    FormsAuthentication.SignOut();

        //    IsEmulating = false;
        //}

        //if (user == null) // cas login, redirect to the cas logout page
        //{
        //    FormsAuthentication.SignOut();
            
        //    // this was raising a "potentially dangerous" warning
        //    //Response.Redirect("https://cas.ucdavis.edu/cas/logout?service=" + STR_RedirectAddress, true);
        //    //Response.Redirect("~/Default.aspx", true);
        //}
        //else
        //{
        //    FormsAuthentication.SignOut();
        //    //Response.Redirect("~/Default.aspx", true);
        //}
    }
}

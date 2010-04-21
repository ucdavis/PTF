using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    private bool IsEmulating
    {
        get { return Session["Emulating"] == null ? false : (bool)Session["Emulating"]; }
        set { Session["Emulating"] = value; }
    }
    private bool IsCasUser
    {
        get { return Session["CasUser"] == null ? false : (bool) Session["CasUser"]; }
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
            IsEmulating = false;

            Response.Redirect("~/Default.aspx");
        }

        if (IsCasUser){Response.Redirect("https://cas.ucdavis.edu/cas/logout?service=" + STR_RedirectAddress, true);}
        else {Response.Redirect("~/Default.aspx");}
    }
}

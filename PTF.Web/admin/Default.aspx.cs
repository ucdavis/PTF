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
using System.Web.Services;
using CAESDO.PTF.BLL;

public partial class admin_Default : System.Web.UI.Page
{
    private bool IsEmulating
    {
        get { return Session["Emulating"] == null ? false : (bool)Session["Emulating"]; }
        set { Session["Emulating"] = value; }
    }
       
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole("EmulationUser"))
        {
            // make the panel visible
            pnlEmulation.Visible = true;

            // check if they are already emulating
            if (IsEmulating)
            {
                // hide the emulate buttons
                tbUserToEmulate.Visible = false;
                btnEmulate.Visible = false;

                // show the already emulating controls
                litCurrentEmulation.Visible = true;
                litCurrentEmulation.Text = "You are currently emulating " + User.Identity.Name;
                btnExitEmulation.Visible = true;
            }
            else
            {
                // hide the emulate buttons
                tbUserToEmulate.Visible = true;
                btnEmulate.Visible = true;

                // show the already emulating controls
                litCurrentEmulation.Visible = false;
                litCurrentEmulation.Text = string.Empty;
                btnExitEmulation.Visible = false;
            }
        }
    }

    [WebMethod]
    public static int ValidateConstruct(string constructCode)
    {
        var values = ConstructBLL.GetByCode(constructCode);

        if (values.Count > 0)
        {
            return values[0].ID;
        }
        else
        {
            return -1;
        }
    }

    [WebMethod]
    public static int ValidateExperiment(string experimentCode)
    {
        var values = ExperimentBLL.GetByCode(experimentCode);

        if (values.Count > 0)
        {
            return values[0].ID;
        }
        else
        {
            return -1;
        }
    }

    protected void btnEmulate_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();

        FormsAuthentication.Initialize();

        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
            tbUserToEmulate.Text,
            DateTime.Now,
            DateTime.Now.AddMinutes(15),
            false,
            String.Empty,
            FormsAuthentication.FormsCookiePath);

        string hash = FormsAuthentication.Encrypt(ticket);
        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

        Response.Cookies.Add(cookie);

        // Mark the session as emulating
        IsEmulating = true;

        Response.Redirect(FormsAuthentication.DefaultUrl);
    }
    protected void btnExitEmulation_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        IsEmulating = false;
        
        Response.Redirect("Default.aspx", true);
    }
}

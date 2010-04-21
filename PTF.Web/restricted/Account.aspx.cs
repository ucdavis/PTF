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
using CAESDO.PTF.Core;
using System.Web.Services;

public partial class restricted_Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateProfile();
        }
    }

    protected void PopulateProfile()
    {
        var profile = UserProfileBLL.GetByUserID((Guid)Membership.GetUser().ProviderUserKey);

        tbAddress1.Text = profile.Address1 ?? string.Empty;
        tbAddress2.Text = profile.Address2 ?? string.Empty;
        tbCity.Text = profile.City ?? string.Empty;
        tbZip.Text = profile.Zip ?? string.Empty;
        tbInternationalState.Text = profile.InternationalState ?? string.Empty;

        if (profile.State != null)
        {
            if (profile.State.IsActive)
            {
                ddlState.SelectedValue = profile.State.ID;
            }
        }
        if (profile.Country != null)
        {
            if (profile.Country.IsActive)
            {
                ddlCountry.SelectedValue = profile.Country.ID;
            }

            if (profile.Country.ID != "USA")
            {
                tbInternationalState.Style["display"] = "inline";
                ddlState.Style["display"] = "none";
            }
            else
            {
                ddlState.Enabled = true;
            }
        }
    }


}

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
using Resources;

public partial class restricted_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // check the user's login to make sure they are a uc email.
            var user = Membership.GetUser().UserName;
            if (!user.EndsWith(CampusList.STR_Berkeley)
                && !user.EndsWith(CampusList.STR_Davis)
                && !user.EndsWith(CampusList.STR_Irvine)
                && !user.EndsWith(CampusList.STR_LA)
                && !user.EndsWith(CampusList.STR_Merced)
                && !user.EndsWith(CampusList.STR_Riverside)
                && !user.EndsWith(CampusList.STR_SanDiego)
                && !user.EndsWith(CampusList.STR_SanFrancisco)
                && !user.EndsWith(CampusList.STR_SantaBarbara)
                && !user.EndsWith(CampusList.STR_SantaCruz)
                )
            {
                // doesn't end with any uc address.
                litDisabledAccount.Visible = true;
            }
            else
            {
                litDisabledAccount.Visible = false;
            }
        }
    }
    protected void odsOrders_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["currentUser"] = Membership.GetUser().ProviderUserKey;
    }
    protected void lvOrders_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

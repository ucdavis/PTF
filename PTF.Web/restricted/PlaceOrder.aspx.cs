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
using CAESDO.PTF.Core.Domain;

public partial class restricted_PlaceOrder : System.Web.UI.Page
{
    private const string STR_USA = "USA";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlMailingCountry.SelectedValue = "USA";
            ddlShippingCountry.SelectedValue = "USA";
        }
    }
    protected void ddlShippingCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlShippingCountry.SelectedValue != STR_USA)
        {
            tbShippingState.Visible = true;
            ddlShippingState.Visible = false;    
        }
        else
        {
            tbShippingState.Visible = false;
            ddlShippingState.Visible = true;
        }

        upShippingState.Update();
    }
    protected void ddlMailingCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMailingCountry.SelectedValue != STR_USA)
        {
            tbMailingState.Visible = true;
            ddlMailingState.Visible = false;
        }
        else
        {
            tbMailingState.Visible = false;
            ddlMailingState.Visible = true;
        }

        upMailingState.Update();
    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        Order newOrder = new Order()
            {
                DateRequested = DateTime.Now,
                PI = tbPI.Text,
                MailingAddress1 = !string.IsNullOrEmpty(tbMailing1.Text) ? tbMailing1.Text : null
            };
    }
}

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
using CAESDO.PTF.BLL;

public partial class restricted_PlaceOrder : System.Web.UI.Page
{
    private const string STR_USA = "USA";
    private const string STR_DDLUnselected = "-1";
    private const string STR_StyleProperty = "display";
    private const string STR_HideValue = "none";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }
    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        Order newOrder = new Order()
            {
                DateRequested = DateTime.Now,
                PI = tbPI.Text,
                MailingAddress1 = !string.IsNullOrEmpty(tbMailing1.Text) ? tbMailing1.Text : null,
                MailingAddress2 = !string.IsNullOrEmpty(tbMailing2.Text) ? tbMailing2.Text : null,
                MailingCity = !string.IsNullOrEmpty(tbMailingCity.Text) ? tbMailingCity.Text : null,
                MailingCountry = ddlShippingCountry.SelectedValue != STR_DDLUnselected ? CountryBLL.GetByID(ddlMailingCountry.SelectedValue) : null,
                MailingState = ddlMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && ddlMailingState.SelectedValue != STR_DDLUnselected ? StateBLL.GetByID(ddlMailingState.SelectedValue) : null,
                MailingInternationalState = tbMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && !string.IsNullOrEmpty(tbMailingState.Text) ? tbMailingState.Text : null,
                MailingZip = tbMailingZip.Text,
                ShippingAddress1 = !string.IsNullOrEmpty(tbShipping1.Text) ? tbShipping1.Text : null,
                ShippingAddress2 = !string.IsNullOrEmpty(tbShipping2.Text) ? tbShipping2.Text : null,
                ShippingCity = !string.IsNullOrEmpty(tbShippingCity.Text) ? tbShippingCity.Text : null,
                ShippingCountry = ddlShippingCountry.SelectedValue != STR_DDLUnselected ? CountryBLL.GetByID(ddlShippingCountry.SelectedValue) : null,
                ShippingState = ddlShippingState.Style[STR_StyleProperty] != STR_DDLUnselected && ddlShippingState.SelectedValue != STR_DDLUnselected ? StateBLL.GetByID(ddlShippingState.SelectedValue) : null,
                ShippingInternationalState = tbShippingState.Style[STR_StyleProperty] != STR_DDLUnselected && !string.IsNullOrEmpty(tbShippingState.Text) ? tbShippingState.Text : null,
                ShippingZip = !string.IsNullOrEmpty(tbShippingZip.Text) ? tbShippingZip.Text : null,
                Contact = !string.IsNullOrEmpty(tbContact.Text) ? tbContact.Text : null,
                ContactEmail = tbContactEmail.Text,
                ContactPhone = !string.IsNullOrEmpty(tbContactPhone.Text) ? tbContactPhone.Text : null,
                RechargeNumber = !string.IsNullOrEmpty(tbRecharge.Text) ? tbRecharge.Text : null,
                
                Plasmid = !string.IsNullOrEmpty(tbPlasmid.Text) ? tbPlasmid.Text : null,
                BacterialSelection = !string.IsNullOrEmpty(tbBacterialSelection.Text) ? tbBacterialSelection.Text : null,
                TransGene = ddlTransGene.SelectedValue != STR_DDLUnselected ? TransGeneBLL.GetByID(Convert.ToInt32(ddlShippingCountry.SelectedValue)) : null,
                PICode = !string.IsNullOrEmpty(tbConstruct.Text) ? tbConstruct.Text : null,
                PIConstructName = !string.IsNullOrEmpty(tbNameOfYourConstruct.Text) ? tbNameOfYourConstruct.Text : null,
                SelectableMarkerPromoter = tbSelectableMarkerPromoter.Text,
                SelectableMarkerGene = tbSelectableMarkerGene.Text,
                
                AdditionalInformation = !string.IsNullOrEmpty(tbAdditionalInfo.Text) ? tbAdditionalInfo.Text : null,
                OtherUCResearch = Convert.ToBoolean(rblOtherUse.SelectedValue),
                UserID = (Guid)Membership.GetUser().ProviderUserKey
            };

        // If the check box is checked then save the mailing address as the shipping address too
        if (cbShippingSame.Checked)
        {
            newOrder.ShippingAddress1 = !string.IsNullOrEmpty(tbMailing1.Text) ? tbMailing1.Text : null;
            newOrder.ShippingAddress2 = !string.IsNullOrEmpty(tbMailing2.Text) ? tbMailing2.Text : null;
            newOrder.ShippingCity = !string.IsNullOrEmpty(tbMailingCity.Text) ? tbMailingCity.Text : null;
            newOrder.ShippingCountry = ddlShippingCountry.SelectedValue != STR_DDLUnselected ? CountryBLL.GetByID(ddlMailingCountry.SelectedValue) : null;
            newOrder.ShippingState = ddlMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && ddlMailingState.SelectedValue != STR_DDLUnselected ? StateBLL.GetByID(ddlMailingState.SelectedValue) : null;
            newOrder.ShippingInternationalState = tbMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && !string.IsNullOrEmpty(tbMailingState.Text) ? tbMailingState.Text : null;
            newOrder.ShippingZip = tbMailingZip.Text;
        }

        OrderBLL.Insert(newOrder);

        Response.Redirect("default.aspx");
    }
}

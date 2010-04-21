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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }
    }
    protected void ddlShippingCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlShippingCountry.SelectedValue == STR_USA)
        {
            tbShippingState.Visible = false;
            ddlShippingState.Visible = true;
            ddlShippingState.Enabled = true;
        }
        else if (ddlShippingCountry.SelectedValue == STR_DDLUnselected)
        {
            tbShippingState.Visible = false;
            ddlShippingState.Visible = true;
            ddlShippingState.Enabled = false;
        }
        else
        {
            tbShippingState.Visible = true;
            ddlShippingState.Visible = false;
        }

        upShippingState.Update();
    }
    protected void ddlMailingCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMailingCountry.SelectedValue == STR_USA)
        {
            tbMailingState.Visible = false;
            ddlMailingState.Visible = true;
            ddlMailingState.Enabled = true;
        }
        else if (ddlMailingCountry.SelectedValue == STR_DDLUnselected)
        {
            tbMailingState.Visible = false;
            ddlMailingState.Enabled = false;
            ddlMailingState.Visible = true;
        }
        else
        {
            tbMailingState.Visible = true;
            ddlMailingState.Visible = false;
        }

        upMailingState.Update();
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
                MailingCountry = ddlShippingCountry.SelectedValue != "-1" ? CountryBLL.GetByID(ddlMailingCountry.SelectedValue) : null,
                MailingState = ddlMailingState.Visible ? StateBLL.GetByID(ddlMailingState.SelectedValue) : null,
                MailingInternationalState = tbMailingState.Visible && !string.IsNullOrEmpty(tbMailingState.Text) ? tbMailingState.Text : null,
                MailingZip = tbMailingZip.Text,
                ShippingAddress1 = !string.IsNullOrEmpty(tbShipping1.Text) ? tbShipping1.Text : null,
                ShippingAddress2 = !string.IsNullOrEmpty(tbShipping2.Text) ? tbShipping2.Text : null,
                ShippingCity = !string.IsNullOrEmpty(tbShippingCity.Text) ? tbShippingCity.Text : null,
                ShippingCountry = ddlShippingCountry.SelectedValue != "-1" ? CountryBLL.GetByID(ddlShippingCountry.SelectedValue) : null,
                ShippingState = ddlShippingState.Visible ? StateBLL.GetByID(ddlShippingState.SelectedValue) : null,
                ShippingInternationalState = tbShippingState.Visible && !string.IsNullOrEmpty(tbShippingState.Text) ? tbShippingState.Text : null,
                ShippingZip = !string.IsNullOrEmpty(tbShippingZip.Text) ? tbShippingZip.Text : null,
                Contact = !string.IsNullOrEmpty(tbContact.Text) ? tbContact.Text : null,
                ContactEmail = tbContactEmail.Text,
                ContactPhone = !string.IsNullOrEmpty(tbContactPhone.Text) ? tbContactPhone.Text : null,
                RechargeNumber = !string.IsNullOrEmpty(tbRecharge.Text) ? tbRecharge.Text : null,
                Crop = ddlCrop.SelectedValue != "-1" ? CropBLL.GetByID(Convert.ToInt32(ddlCrop.SelectedValue)) : null,
                Cultivar = !string.IsNullOrEmpty(tbCultivar.Text) ? tbCultivar.Text : null,
                NumberOfPlants = Convert.ToInt32(tbNumberofPlants.Text),
                Plasmid = !string.IsNullOrEmpty(tbPlasmid.Text) ? tbPlasmid.Text : null,
                BacterialSelection = !string.IsNullOrEmpty(tbBacterialSelection.Text) ? tbBacterialSelection.Text : null,
                AgroBacteriumStrain = !string.IsNullOrEmpty(tbAgrobacteriumStrain.Text) ? tbAgrobacteriumStrain.Text : null,
                PlantSelection = !string.IsNullOrEmpty(tbPlantSelection.Text) ? tbPlantSelection.Text : null,
                Construct = !string.IsNullOrEmpty(tbConstruct.Text) ? tbConstruct.Text : null,
                NameOfYourConstruct = !string.IsNullOrEmpty(tbNameOfYourConstruct.Text) ? tbNameOfYourConstruct.Text : null,
                TransGene = ddlTransGene.SelectedValue != "-1" ? TransGeneBLL.GetByID(Convert.ToInt32(ddlTransGene.SelectedValue)) : null,
                GeneOfInterestPromoter = !string.IsNullOrEmpty(tbGeneOfInterestPromoter.Text) ? tbGeneOfInterestPromoter.Text : null,
                GeneOfInterestGene = !string.IsNullOrEmpty(tbGeneOfInterestGene.Text) ? tbGeneOfInterestGene.Text : null,
                GeneOfInterestTerminator = !string.IsNullOrEmpty(tbGeneOfInterestTerminator.Text) ? tbGeneOfInterestTerminator.Text : null,
                SelectableMarkerPromoter = tbSelectableMarkerPromoter.Text,
                SelectableMarkerGene = tbSelectableMarkerGene.Text,
                SelectableMarkerTerminator = !string.IsNullOrEmpty(tbSelectableMarkerTerminator.Text) ? tbSelectableMarkerTerminator.Text : null,
                ScorableMarkerPromoter = !string.IsNullOrEmpty(tbScorableMarkerPromoter.Text) ? tbScorableMarkerPromoter.Text : null,
                ScorableMarkerGene = !string.IsNullOrEmpty(tbScorableMarkerGene.Text) ? tbScorableMarkerGene.Text : null,
                ScorableMarkerTerminator = !string.IsNullOrEmpty(tbScorableMarkerTerminator.Text) ? tbScorableMarkerTerminator.Text : null,
                AdditionalInformation = !string.IsNullOrEmpty(tbAdditionalInfo.Text) ? tbAdditionalInfo.Text : null,
                OtherUCResearch = Convert.ToBoolean(rblOtherUse.SelectedValue)
            };
    }
}

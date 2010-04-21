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
                Crop = ddlCrop.SelectedValue != STR_DDLUnselected ? CropBLL.GetByID(Convert.ToInt32(ddlCrop.SelectedValue)) : null,
                Cultivar = !string.IsNullOrEmpty(tbCultivar.Text) ? tbCultivar.Text : null,
                NumberOfPlants = Convert.ToInt32(tbNumberofPlants.Text),
                Plasmid = !string.IsNullOrEmpty(tbPlasmid.Text) ? tbPlasmid.Text : null,
                BacterialSelection = !string.IsNullOrEmpty(tbBacterialSelection.Text) ? tbBacterialSelection.Text : null,
                AgroBacteriumStrain = !string.IsNullOrEmpty(tbAgrobacteriumStrain.Text) ? tbAgrobacteriumStrain.Text : null,
                PlantSelection = !string.IsNullOrEmpty(tbPlantSelection.Text) ? tbPlantSelection.Text : null,
                Construct = !string.IsNullOrEmpty(tbConstruct.Text) ? tbConstruct.Text : null,
                NameOfYourConstruct = !string.IsNullOrEmpty(tbNameOfYourConstruct.Text) ? tbNameOfYourConstruct.Text : null,
                TransGene = ddlTransGene.SelectedValue != STR_DDLUnselected ? TransGeneBLL.GetByID(Convert.ToInt32(ddlTransGene.SelectedValue)) : null,
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

﻿using System;
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
using System.Collections.Generic;

public partial class restricted_PlaceOrder : System.Web.UI.Page
{
    private const string STR_USA = "USA";
    private const string STR_DDLUnselected = "-1";
    private const string STR_StyleProperty = "display";
    private const string STR_HideValue = "none";
    private const string STR_PlantInformationControls = "PlantInformationControls";

    private List<List<string>> PlantInformationControls
    {
        get {
            if (Session[STR_PlantInformationControls] == null)
            {
                return new List<List<string>>();
            }
            else
            {
                return (List<List<string>>)Session[STR_PlantInformationControls];
            }
        }
        set {
            Session[STR_PlantInformationControls] = value;
        }
    }
    private enum ControlNames { ddlCrop = 0, ddlGenotype, tbNumPlants, ddlPlantSelection }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // null out the session variable so we start fresh on a new load
            Session[STR_PlantInformationControls] = null;
            // add the first set of controls
            AddControls();

            // populate profile information as necessary
            PopulateProfile();
        }
        
        // need to recreate the controls every time
        AddPlantInformationControls();

        if (!Page.IsPostBack)
        {
            // need to insert another one so the next time we post back it will create the extra set
            // the page load runs before the event for the button, so this will add the next est on the load
            // and the button even will add a new set for the next time around.
            // need to keep the control set count 1 more than what we want
            AddControls();
        }
    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        Order newOrder = new Order()
            {
                DateRequested = DateTime.Now,
                PI = tbPI.Text,
                MailingAddress1 = tbMailing1.Text,
                MailingAddress2 = !string.IsNullOrEmpty(tbMailing2.Text) ? tbMailing2.Text : null,
                MailingCity = tbMailingCity.Text,
                MailingCountry = CountryBLL.GetByID(ddlMailingCountry.SelectedValue),
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
                Contact = tbContact.Text,
                ContactEmail = tbContactEmail.Text,
                ContactPhone = tbContactPhone.Text,
                RechargeNumber = !string.IsNullOrEmpty(tbRecharge.Text) ? tbRecharge.Text : null,
                
                Plasmid = tbPlasmid.Text,
                BacterialSelection = tbBacterialSelection.Text,
                AgroStrain = AgroStrainBLL.GetByID(Convert.ToInt32(ddlAgroStrain.SelectedValue)),
                TransGene = TransGeneBLL.GetByID(Convert.ToInt32(ddlTransGene.SelectedValue)),
                PICode = tbConstruct.Text,
                PIConstructName = tbNameOfYourConstruct.Text,
                SelectableMarkerPromoter = tbSelectableMarkerPromoter.Text,
                SelectableMarkerGene = tbSelectableMarkerGene.Text,
                Trait = tbTrait.Text,
                

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
            newOrder.ShippingCountry = ddlMailingCountry.SelectedValue != STR_DDLUnselected ? CountryBLL.GetByID(ddlMailingCountry.SelectedValue) : null;
            newOrder.ShippingState = ddlMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && ddlMailingState.SelectedValue != STR_DDLUnselected ? StateBLL.GetByID(ddlMailingState.SelectedValue) : null;
            newOrder.ShippingInternationalState = tbMailingState.Style[STR_StyleProperty] != STR_DDLUnselected && !string.IsNullOrEmpty(tbMailingState.Text) ? tbMailingState.Text : null;
            newOrder.ShippingZip = tbMailingZip.Text;
        }

        // deal with the suborders
        newOrder.SubOrders = new List<SubOrder>();

        SubOrder sOrder;
        // only want n-1 objects, the last one was a placeholder
        for (int i = 0; i < PlantInformationControls.Count - 1; i++)
        {           
            DropDownList cropDDL = ((DropDownList)phPlantInformation.FindControl(PlantInformationControls[i][(int)ControlNames.ddlCrop]));
            DropDownList genotypeDDL = ((DropDownList)phPlantInformation.FindControl(PlantInformationControls[i][(int)ControlNames.ddlGenotype]));
            DropDownList plantselectionDDL = ((DropDownList)phPlantInformation.FindControl(PlantInformationControls[i][(int)ControlNames.ddlPlantSelection]));
            TextBox numPlantsTB = ((TextBox)phPlantInformation.FindControl(PlantInformationControls[i][(int)ControlNames.tbNumPlants]));

            // test to see if all of the fields were supplied
            if (cropDDL.SelectedValue != STR_DDLUnselected && genotypeDDL.SelectedValue != STR_DDLUnselected && plantselectionDDL.SelectedValue != STR_DDLUnselected && !string.IsNullOrEmpty(numPlantsTB.Text))
            {
                sOrder = new SubOrder()
                {
                    Crop = CropBLL.GetByID(Convert.ToInt32(cropDDL.SelectedValue)),
                    GenoType = GenoTypeBLL.GetByID(Convert.ToInt32(genotypeDDL.SelectedValue)),
                    PlantSelection = PlantSelectionBLL.GetByID(Convert.ToInt32(plantselectionDDL.SelectedValue)),
                    NumberOfPlants = Convert.ToInt32(numPlantsTB.Text),
                    Order = newOrder
                };

                newOrder.SubOrders.Add(sOrder);
            }
        }

        // insert the order and email the admin
        OrderBLL.Insert(newOrder, ConfigurationManager.AppSettings["EmailFrom"], ConfigurationManager.AppSettings["OrderPlacedEmail"]);

        Response.Redirect("default.aspx");
    }

    protected void AddPlantInformationControls()
    {
        foreach (List<string> controlNames in PlantInformationControls)
        {
            // we don't want a break line before the first item
            if (!controlNames[0].Contains("01"))
            {
                HtmlGenericControl breakLine = new HtmlGenericControl();
                breakLine.InnerHtml = "<br/>";
                phPlantInformation.Controls.Add(breakLine);
            }

            DropDownList cropDDL = new DropDownList();
            cropDDL.ID = controlNames[(int)ControlNames.ddlCrop];
            cropDDL.DataSourceID = "odsCrop";
            cropDDL.DataTextField = "Name";
            cropDDL.DataValueField = "id";
            cropDDL.AppendDataBoundItems = true;
            cropDDL.Items.Add(new ListItem("--Select a Crop--", STR_DDLUnselected));
            phPlantInformation.Controls.Add(cropDDL);

            DropDownList genotypeDDL = new DropDownList();
            genotypeDDL.ID = controlNames[(int)ControlNames.ddlGenotype];
            genotypeDDL.DataSourceID = "odsGenoType";
            genotypeDDL.DataTextField = "Name";
            genotypeDDL.DataValueField = "id";
            genotypeDDL.AppendDataBoundItems = true;
            genotypeDDL.Items.Add(new ListItem("--Select a Genotype--", STR_DDLUnselected));
            phPlantInformation.Controls.Add(genotypeDDL);

            DropDownList plantSelectionDDL = new DropDownList();
            plantSelectionDDL.ID = controlNames[(int)ControlNames.ddlPlantSelection];
            plantSelectionDDL.DataSourceID = "odsPlantSelection";
            plantSelectionDDL.DataTextField = "Name";
            plantSelectionDDL.DataValueField = "id";
            plantSelectionDDL.AppendDataBoundItems = true;
            plantSelectionDDL.Items.Add(new ListItem("--Select a Plant Selection--", STR_DDLUnselected));
            phPlantInformation.Controls.Add(plantSelectionDDL);

            TextBox tbNumPlants = new TextBox();
            tbNumPlants.ID = controlNames[(int)ControlNames.tbNumPlants];
            phPlantInformation.Controls.Add(tbNumPlants);
        }
    }

    protected void AddControls()
    {
        string cropDLLId = "ddlCrop" + PlantInformationControls.Count + 1;
        string genotypeDDLId = "ddlGenotype" + PlantInformationControls.Count + 1;
        string numPlantsTBId = "tbNumPlants" + PlantInformationControls.Count + 1;
        string plantSelectionDDLId = "ddlPlantSelection" + PlantInformationControls.Count + 1;

        List<string> controlNames = new List<string>();
        controlNames.Add(cropDLLId);
        controlNames.Add(genotypeDDLId);
        controlNames.Add(plantSelectionDDLId);
        controlNames.Add(numPlantsTBId);

        List<List<string>> masterList = PlantInformationControls;
        masterList.Add(controlNames);
        PlantInformationControls = masterList;
    }

    protected void PopulateProfile()
    {
        var profile = UserProfileBLL.GetByUserID((Guid)Membership.GetUser().ProviderUserKey);

        tbMailing1.Text = profile.Address1 ?? string.Empty;
        tbMailing2.Text = profile.Address2 ?? string.Empty;
        tbMailingCity.Text = profile.City ?? string.Empty;
        tbMailingZip.Text = profile.Zip ?? string.Empty;
        tbMailingState.Text = profile.InternationalState ?? string.Empty;

        if (profile.State != null)
        {
            if (profile.State.IsActive)
            {
                ddlMailingState.SelectedValue = profile.State.ID;
            }
        }
        if (profile.Country != null)
        {
            if (profile.Country.IsActive)
            {
                ddlMailingCountry.SelectedValue = profile.Country.ID;
            }

            if (profile.Country.ID != "USA")
            {
                tbMailingState.Style["display"] = "inline";
                ddlMailingState.Style["display"] = "none";
            }
            else
            {
                ddlMailingState.Enabled = true;
            }
        }
    }

    protected void lbAddPlantInformationFields_Click(object sender, EventArgs e)
    {
        AddControls();
    }
}

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
using System.Text;
using CAESDO.PTF.Core.Domain;
using Resources;
using System.Web.Services;

public partial class admin_Order : System.Web.UI.Page
{
    private const string STR_OrderIDQueryString = "oid";
    private const string STR_Other = "Other";

    private int OrderID
    {
        get
        {
            if (Request.QueryString[STR_OrderIDQueryString] != null)
            {
                try
                {
                    return Convert.ToInt32(Request.QueryString[STR_OrderIDQueryString]);
                }
                catch
                {
                    // catch invalid query strings
                    Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));
                }
            }

            // a valid order id is required for this page
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));

            return -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // populate the fields but also validates that we have a valid order
            PopulateInfoFields();

            // deal with the permissions on the changable objects
            if (User.IsInRole("Reader"))
            {
                tbWorkingBox.Enabled = false;
                tbLocation.Enabled = false;
                tbArchivedBox.Enabled = false;
                tbPosition.Enabled = false;

                tbComments.Enabled = false;

                btnNewConstruct.Visible = false;

            }
       }
    }

    protected void PopulateInfoFields()
    {
        try
        {
            var order = OrderBLL.GetByID(OrderID);

            litOrderID.Text = order.ID.ToString();
            litDateRequested.Text = order.DateRequested.ToString("d");

            // customer information
            litPI.Text = order.PI;
            litContact.Text = order.Contact;
            litContactPhone.Text = order.ContactPhone;
            litContactEmail.Text = order.ContactEmail;

            litMailing.Text = this.GenerateAddress(order.MailingAddress1, order.MailingAddress2, order.MailingCity, order.MailingState, order.MailingInternationalState, order.MailingZip, order.MailingCountry);
            litShipping.Text = this.GenerateAddress(order.ShippingAddress1, order.ShippingAddress2, order.ShippingCity, order.ShippingState, order.ShippingInternationalState, order.ShippingZip, order.ShippingCountry);

            if (!order.RequiresContract)
            {
                // this order has a recharge number no need for a contract
                litRechargeNumber.Text = order.RechargeNumber;
                tbContractNumber.Enabled = false;
            }
            else
            {
                // contract is required
                tbContractNumber.Visible = true;
                tbContractNumber.Text = order.ContractNumber;

                litRechargeNumber.Text = CommonStrings.STR_NotAvailable;
            }
            if (order.RequiresShippingPermit)
            {
                // display information regarding shipping permits
                litShippingPermit.Text = !string.IsNullOrEmpty(order.ShippingPermit) ? order.ShippingPermit : "Awaiting Client";
            }
            else
            {
                // shipping permit is not required
                litShippingPermit.Text = CommonStrings.STR_NotAvailable;
            }

            // order information
            litPICode.Text = order.PICode;
            litConstructName.Text = order.PIConstructName;
            litPlasmid.Text = order.Plasmid;
            litBacterialSelection.Text = order.BacterialSelection;
            litAgroStrain.Text = order.AgroStrain.Name;
            litTransgene.Text = order.TransGene.Name;
            litTrait.Text = order.Trait;
            litSelectableMarkerPromoter.Text = order.SelectableMarkerPromoter;
            litSelectableMarkerGene.Text = order.SelectableMarkerGene;
            litAdditionalInformation.Text = order.AdditionalInformation;

            tbWorkingBox.Text = order.WorkingBox;
            tbLocation.Text = order.Location;
            tbArchivedBox.Text = order.ArchiveBox;
            tbPosition.Text = order.Position;

            tbComments.Text = order.Comments;

            lvSuborders.DataSource = order.SubOrders;
            lvSuborders.DataBind();

            gvSuborder.DataSource = order.SubOrders;
            gvSuborder.DataBind();
        }
        catch 
        {
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));
        }
    }

    private string GenerateAddress(string address1, string address2, string city, State state, string internationalState, string zip, Country country)
    {
        StringBuilder address = new StringBuilder();

        address.Append(address1 + "<br/>");
        // only use address 2 if the client entered something
        if (address2 != null)
        {
            address.Append(address2 + "<br/>");
        }
        address.Append(city + "<br/>");

        // decide which state to use
        if (country.ID == "USA")
        {
            address.Append(", " + state.Name);
        }
        else
        {
            address.Append(", " + internationalState);
        }

        address.Append(" " + zip);

        // if outside the usa, add the country name
        if (country.ID != "USA")
        {
            address.Append("<br/>" + country.Name);
        }

        return address.ToString();
    }
    protected void gvSuborder_SelectedIndexChanged(object sender, EventArgs e)
    {
        // create a new construct for this suborder
        var suborder = SubOrderBLL.GetByID(Convert.ToInt32(gvSuborder.SelectedDataKey.Value));

        Construct newConstruct = new Construct()
            {
                Order = suborder.Order,
                SubOrder = suborder
            };

        ConstructBLL.Insert(newConstruct);

        // update the list view with all sub orders
        lvSuborders.DataSource = suborder.Order.SubOrders;
        lvSuborders.DataBind();
    }

    protected void gvSuborder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var suborder = (SubOrder)e.Row.DataItem;

            if (suborder.PlantSelection.Name == STR_Other || suborder.GenoType.Name == STR_Other)
            {
                e.Row.Cells[0].Text = string.Empty;
            }
        }
    }

    protected void lbBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Orders.aspx", true);
    }
    protected void lvSuborders_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            var suborder = (SubOrder)((ListViewDataItem)e.Item).DataItem;

            // plant selection is other, show the drop down list
            if (suborder.PlantSelection.Name == STR_Other && (User.IsInRole("Admin") || User.IsInRole("User")))
            {
                var ddlPlantSelection = (DropDownList)e.Item.FindControl("ddlPlantSelection");

                // remove the "Other" option
                var plantSelectionList = suborder.Crop.PlantSelections;
                plantSelectionList.Remove(PlantSelectionBLL.GetByName(STR_Other));

                // populate the drop down based on the crop
                ddlPlantSelection.DataSource = plantSelectionList;
                ddlPlantSelection.DataBind();

                var pnlPlantSelection = (Panel)e.Item.FindControl("pnlPlantSelection");

                // make it visible
                pnlPlantSelection.Visible = true;
            }
            // plant selection is set
            else
            {
                var litPlantSelection = (Literal)e.Item.FindControl("litPlantSelection");

                litPlantSelection.Text = suborder.PlantSelection.Name;
            }

            // genotype is other, show the drop down
            if (suborder.GenoType.Name == STR_Other && (User.IsInRole("Admin") || User.IsInRole("User")))
            {
                var ddlGenotype = (DropDownList)e.Item.FindControl("ddlGenotype");

                // Remove the Other Option
                var genotypeList = suborder.Crop.GenoTypes;
                genotypeList.Remove(GenoTypeBLL.GetByName(STR_Other));

                // populate the drop down based on the crop
                ddlGenotype.DataSource = genotypeList;
                ddlGenotype.DataBind();

                var pnlGenotype = (Panel)e.Item.FindControl("pnlGenotype");

                // make it visible
                pnlGenotype.Visible = true;
            }
            // genotype is set
            else
            {
                var litGenotype = (Literal)e.Item.FindControl("litGenotype");

                litGenotype.Text = suborder.GenoType.Name;
            }
        }
    }
}

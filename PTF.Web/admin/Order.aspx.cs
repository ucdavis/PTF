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
                litContractExecuted.Text = CommonStrings.STR_NotAvailable;
            }
            else
            {
                // contract is required
                if (!order.ContractExecuted)
                {
                    // make the button visible
                    litContractExecuted.Text = "No";
                    lbExecuted.Visible = true;
                }
                else
                {
                    // contract has been executed.
                    litContractExecuted.Text = "Yes";
                }
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

            litWorkingBox.Text = order.WorkingBox;
            litLocation.Text = order.Location;
            litArchivedBox.Text = order.ArchiveBox;
            litPosition.Text = order.Position;

            litComments.Text = order.Comments;

            lvSuborders.DataSource = order.SubOrders;
            lvSuborders.DataBind();

            gvSuborder.DataSource = order.SubOrders;
            gvSuborder.DataBind();
        }
        catch (NHibernate.ObjectNotFoundException onfe)
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

    [WebMethod]
    public static void ExecuteContract(int orderID)
    {
        var order = OrderBLL.GetByID(orderID);

        order.ContractExecuted = true;

        OrderBLL.Update(order);
    }
}

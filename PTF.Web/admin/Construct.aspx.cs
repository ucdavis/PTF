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

public partial class admin_Construct : System.Web.UI.Page
{
    private const string STR_OrderIDQueryString = "OID";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // if an order id is provided then show only those constructs for that order
            if (Request.QueryString[STR_OrderIDQueryString] != null)
            {
                lvConstructs.DataSourceID = "odsConstructsByOrder";
                lvConstructs.DataBind();

                // get the order information and display it
                PopulateOrderPanel(Convert.ToInt32(Request.QueryString[STR_OrderIDQueryString]));
            }
        }
    }

    /// <summary>
    /// Populates and makes the order panel visible
    /// </summary>
    /// <param name="OrderID"></param>
    protected void PopulateOrderPanel(int OrderID)
    {
        // show the panel
        pnlOrderDetails.Visible = true;

        var order = OrderBLL.GetByID(OrderID);

        //left column
        lblOrderID.Text = order.ID.ToString();
        lblPI.Text = order.PI;

        lblBacterialSelection.Text = order.BacterialSelection;
        lblAgroBacteriumStrain.Text = order.AgroBacteriumStrain;
        lblPlantSelection.Text = order.PlantSelection;

        //right column
        lblContact.Text = order.Contact;
        lblContactEmail.Text = order.ContactEmail;
        lblContactPhone.Text = order.ContactPhone;

        lblAddress1.Text = order.MailingAddress1 != null ? order.MailingAddress1 : string.Empty;
        lblAddress2.Text = order.MailingAddress2 != null ? order.MailingAddress2 : string.Empty;
        lblCity.Text = order.MailingCity != null ? order.MailingCity : string.Empty;
        lblZip.Text = order.MailingZip != null ? order.MailingZip : string.Empty;

        // united states state value
        if (order.MailingState != null)
        {
            lblState.Text = order.MailingState.Name;
        }
        else if (order.MailingInternationalState != null) // international state entered
        {
            lblState.Text = order.MailingInternationalState;
            // show the state only if we have an international country
            lblCountry.Text = order.MailingCountry.Name != null ? order.MailingCountry.Name : string.Empty;
        }

        // handle the recharge/contract information
        if (!string.IsNullOrEmpty(order.RechargeNumber))
        {
            // recharge number has been provided
            lblRechargeNumber.Text = order.RechargeNumber;

            lblContact.Text = "No contract necessary.";
            lblContact.Visible = false;
        }
        else
        {
            // no recharge number provided
            lblRechargeNumber.Text = "----------";

            lblContact.Text = order.ContractExecuted ? "Yes" : "No";

            if (order.ContractExecuted)
            {
                lblContact.Visible = true;
            }
        }
    }
    protected void lbHoldPendingContract_Command(object sender, CommandEventArgs e)
    {
        var construct = ConstructBLL.SetHoldPendingContract(ConstructBLL.GetByID(Convert.ToInt32(e.CommandArgument)));

        ConstructBLL.Update(construct);

        lvConstructs.DataBind();
    }
    protected void lbSetPending_Command(object sender, CommandEventArgs e)
    {
        var construct = ConstructBLL.SetPending(ConstructBLL.GetByID(Convert.ToInt32(e.CommandArgument)));

        ConstructBLL.Update(construct);

        lvConstructs.DataBind();
    }
}

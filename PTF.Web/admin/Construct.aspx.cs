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

            return -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // if an order id is provided then show only those constructs for that order
            if (OrderID > 0)
            {
                lvConstructs.DataSourceID = "odsConstructsByOrder";
                lvConstructs.DataBind();

                // get the order information and display it
                PopulateOrderPanel(OrderID);
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

            lblContract.Text = "No contract necessary.";
            lbContractExecuted.Visible = false;
        }
        else
        {
            // no recharge number provided
            lblRechargeNumber.Text = "----------";

            lblContract.Text = order.ContractExecuted ? "Yes" : "No";

            if (!order.ContractExecuted)
            {
                lbContractExecuted.Visible = true;
            }
            else
            {
                lbContractExecuted.Visible = false;
            }
        }

        // hide the data pager when no constructs are available
        if (order.Constructs.Count < 20)
        {
            DataPager1.Visible = false;
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
    protected void lbContractExecuted_Click(object sender, EventArgs e)
    {

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        CAESDO.PTF.Core.Domain.Construct construct = new CAESDO.PTF.Core.Domain.Construct()
        {
            PlantsRequested = tbPlantsRequested.Text,
            PIConstructName = tbPIConstructName.Text,
            PICode = tbPICode.Text,
            AgroStrain = AgroStrainBLL.GetByID(Convert.ToInt32(ddlAgroStrain.SelectedValue)),
            BacterialSelection = tbBacterialSelection.Text,
            Plasmid = tbPlasmid.Text,
            Trait = tbTrait.Text,
            GeneOfInterest = tbGeneofInterest.Text,
            SelectableMarker = SelectableMarkerBLL.GetByID(Convert.ToInt32(ddlSelectableMarker.SelectedValue)),
            Crop = CropBLL.GetByID(Convert.ToInt32(ddlCrop.SelectedValue)),
            Genotype = GenoTypeBLL.GetByID(Convert.ToInt32(ddlGenotype.SelectedValue)),
            DateReceived = DateTime.Parse(tbDateReceived.Text),
            Comments = !string.IsNullOrEmpty(tbComment.Text) ? tbComment.Text : null,
            Order = OrderBLL.GetByID(OrderID)
        };

        decimal parsedRecharge;

        if (decimal.TryParse(tbRechargeAmount.Text, out parsedRecharge))
        {
            construct.RechargeAmount = parsedRecharge;
        }

        // Save the object
        ConstructBLL.Insert(construct);

        // update the list view to reflect the new construct
        lvConstructs.DataBind();

        if (lvConstructs.Items.Count >= 20)
        {
            DataPager1.Visible = true;
        }

        // reset the boxes in the popup.

    }
}

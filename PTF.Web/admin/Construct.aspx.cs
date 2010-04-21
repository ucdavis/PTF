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
using CAESDO.PTF.Core.Domain;
using System.Web.Services;

public partial class admin_Construct : System.Web.UI.Page
{
    private const string STR_ConstructIDQueryString = "cid";

    private int ConstructID
    {
        get
        {
            if (Request.QueryString[STR_ConstructIDQueryString] != null)
            {
                try
                {
                    return Convert.ToInt32(Request.QueryString[STR_ConstructIDQueryString]);
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
            PopulateInfoFields();
        }
    }

    protected void PopulateInfoFields()
    {
        try
        {
            var construct = ConstructBLL.GetByID(ConstructID);

            litConstructCode.Text = construct.ConstructCode;
            litDateCreated.Text = construct.DateCreated.ToString("d");

            litCrop.Text = construct.SubOrder.Crop.Name;
            litGenotype.Text = construct.SubOrder.GenoType.Name;
            litPlantSelection.Text = construct.SubOrder.PlantSelection.Name;
            litAgroStrain.Text = construct.Order.AgroStrain.Name;
            litBacterialSelection.Text = construct.Order.BacterialSelection;
            litPlasmid.Text = construct.Order.Plasmid;
            litPICode.Text = construct.Order.PICode;
            litInvoiceDate.Text = construct.InvoiceDate != null ? ((DateTime)construct.InvoiceDate).ToString("d") : string.Empty;
            litRecharge.Text = construct.RechargeAmount.ToString("c");

            lvExperiments.DataSource = construct.Experiments;
            lvExperiments.DataBind();
        }
        catch (NHibernate.ObjectNotFoundException onfe)
        {
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Experiment exp = new Experiment()
            {
                Operator = OperatorBLL.GetByID(Convert.ToInt32(ddlOperators.SelectedValue)),
                SeedLotNumber = tbSeedLotNumber.Text,
                Explant = tbExplant.Text,
                OpticalDensity = decimal.Parse(tbOpticalDensity.Text),
                Construct = ConstructBLL.GetByID(ConstructID)
            };

        ExperimentBLL.Insert(exp);

        lvExperiments.DataSource = ConstructBLL.GetByID(ConstructID).Experiments;
        lvExperiments.DataBind();

        // clear out the controls
        ddlOperators.SelectedIndex = -1;
        tbSeedLotNumber.Text = string.Empty;
        tbExplant.Text = string.Empty;
        tbOpticalDensity.Text = string.Empty;
    }

    [WebMethod]
    public static string ChangeRecharge(int ConstructID, decimal RechargeAmount)
    {
        ConstructBLL.ChangeRechargeAmount(ConstructID, RechargeAmount);

        return RechargeAmount.ToString("c");
    }
}

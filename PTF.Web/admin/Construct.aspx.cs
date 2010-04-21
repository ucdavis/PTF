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
using Resources;

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

            if (User.IsInRole("Reader"))
            {
                btnNewExperiment.Visible = false;
            }
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
            tbRecharge.Text = construct.RechargeAmount.ToString();
            litStatus.Text = construct.Status.Name;

            tbComments.Text = construct.Comments;

            lvExperiments.DataSource = construct.Experiments;
            lvExperiments.DataBind();

            // add a warning if the contract has not been executed yet.
            if (string.IsNullOrEmpty(construct.Order.ContractNumber) && construct.Order.RequiresContract)
            {
                litContractNotExecuted.Text = CommonStrings.STR_ContractNotExecutedWarning;
            }

            // disable the create experiment
            if (construct.IsLocked)
            {
                btnNewExperiment.Enabled = false;
            }

            if (construct.IsLocked)
            {
                ibtnLock.ImageUrl = "../Images/locked.png";
            }
            else
            {
                ibtnLock.ImageUrl = "../Images/unlocked.png";
            }
        }
        catch 
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

        // update the status in case something changes
        litStatus.Text = ConstructBLL.GetByID(ConstructID).Status.Name;
    }
    protected void lbBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Order.aspx?oid=" + ConstructBLL.GetByID(ConstructID).Order.ID.ToString(), true);
    }

    protected void ExportReport(string reportName, ArrayList parameters)
    {
        Microsoft.Reporting.WebForms.ReportViewer rview = new Microsoft.Reporting.WebForms.ReportViewer();
        rview.ServerReport.ReportServerUrl = new Uri(System.Web.Configuration.WebConfigurationManager.AppSettings["ReportServer"]);

        rview.ServerReport.ReportPath = reportName;

        System.Collections.Generic.List<Microsoft.Reporting.WebForms.ReportParameter> paramList = new System.Collections.Generic.List<Microsoft.Reporting.WebForms.ReportParameter>();

        if (parameters.Count > 0)
        {
            foreach (ArrayList al in parameters)
            {
                paramList.Add(new Microsoft.Reporting.WebForms.ReportParameter(al[0].ToString(), al[1].ToString()));
            }
            rview.ServerReport.SetParameters(paramList);
        }

        string mimeType, encoding, extension, deviceInfo;
        string[] streamids;
        Microsoft.Reporting.WebForms.Warning[] warnings;
        string format = "PDF";

        deviceInfo =
        "<DeviceInfo>" +
        "<SimplePageHeaders>True</SimplePageHeaders>" +
        "</DeviceInfo>";

        byte[] bytes = rview.ServerReport.Render(format, deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);

        Response.Clear();

        if (format == "PDF")
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-disposition", "filename=output.pdf");
        }
        else
        {
            Response.ContentType = "application/excel";
            Response.AddHeader("Content-disposition", "filename=output.xls");
        }

        Response.OutputStream.Write(bytes, 0, bytes.Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        Response.Flush();
        Response.Close();
    }
    protected void lbGenerateInvoice_Click(object sender, EventArgs e)
    {
        string report = "/PTF/Invoice";

        ArrayList parameters = new ArrayList();
        ArrayList parameter = new ArrayList();
        parameter.Add("ConstructCode");
        parameter.Add(ConstructBLL.GetByID(ConstructID).ConstructCode);
        parameters.Add(parameter);

        this.ExportReport(report, parameters);
    }
}

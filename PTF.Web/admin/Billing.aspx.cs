using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CAESDO.PTF.BLL;
using Microsoft.Reporting.WebForms;

public partial class admin_Billing : System.Web.UI.Page
{
    private static readonly string ReportViewerUserName = ConfigurationManager.AppSettings["ReportViewerUser"];
    private static readonly string ReportViewerPassword = ConfigurationManager.AppSettings["ReportViewerPassword"];
    private static readonly string ReportViewerDomainName = ConfigurationManager.AppSettings["ReportViewerDomain"];
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lvConstructs_SelectedIndexChanged(object sender, EventArgs e)
    {
        var constructID = ((ListView)sender).SelectedDataKey.Value;
        ConstructBLL.Bill(ConstructBLL.GetByID(Convert.ToInt32(constructID)));

        lvConstructs.DataBind();
    }

    protected void lbInvoice_OnCommand(object sender, CommandEventArgs e)
    {
        var construct = ConstructBLL.GetByID(Convert.ToInt32(e.CommandArgument));

        if (construct.Status.IsComplete)
        {
            string report = "/PTF/Invoice";

            ArrayList parameters = new ArrayList();
            ArrayList parameter = new ArrayList();
            parameter.Add("ConstructCode");
            parameter.Add(construct.ConstructCode);
            parameters.Add(parameter);

            this.ExportReport(report, parameters);
        }
        else
        {
            Response.Write("Construct is not complete yet, you cannot invoice.");
        }
    }

    protected void ExportReport(string reportName, ArrayList parameters)
    {
        Microsoft.Reporting.WebForms.ReportViewer rview = new Microsoft.Reporting.WebForms.ReportViewer();

        IReportServerCredentials myCredentials = new CustomReportCredentials(ReportViewerUserName, ReportViewerPassword, ReportViewerDomainName);
        rview.ServerReport.ReportServerCredentials = myCredentials;

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

    public class CustomReportCredentials : IReportServerCredentials
    {
        private string _userName;
        private string _passWord;
        private string _domainName;

        public CustomReportCredentials(string userName, string passWord, string domainName)
        {
            _userName = userName;
            _passWord = passWord;
            _domainName = domainName;
        }

        public System.Security.Principal.WindowsIdentity ImpersonationUser
        {
            get { return null; }
        }

        public ICredentials NetworkCredentials
        {
            get { return new NetworkCredential(_userName, _passWord, _domainName); }
        }

        public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password,
            out string authority)
        {
            authCookie = null;
            user = password = authority = null;
            return false;
        }
    }
}

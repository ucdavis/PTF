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
using ceTe.DynamicPDF;
using ceTe.DynamicPDF.PageElements;
using CAESOps;
using System.Text;

public partial class admin_Label2 : System.Web.UI.Page
{
    protected ExcelOps xops;

    protected void Page_Load(object sender, EventArgs e)
    {
        Document pdfDoc = new Document();
        pdfDoc.Author = "Alan Lai";
        pdfDoc.Title = "Label Test";

        ceTe.DynamicPDF.Page page = new ceTe.DynamicPDF.Page();
        page.Dimensions.Height = 1.0f;
        page.Dimensions.Width = 4.0f;

        StringBuilder formattedText = new StringBuilder();
        formattedText.Append("011003-000<br/>");
        formattedText.Append("tomato<br/>");
        formattedText.Append("Moneymaker<br/>");
        formattedText.Append("Bradford<br/>");
        formattedText.Append("<b>TRANSGENIC</b><br/>");

        FormattedTextArea fta = new FormattedTextArea(formattedText.ToString(), 0, 0, 100, 100, FontFamily.Times, 10, true);

        page.Elements.Add(fta);

        page.Elements.Add(fta);

        pdfDoc.Pages.Add(page);

        pdfDoc.DrawToWeb(this);
    }
}

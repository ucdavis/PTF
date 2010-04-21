using System;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lit_ErrorType.Text = PTFConfiguration.ErrorMessage(Request.QueryString["reason"]);
        }
    }
}

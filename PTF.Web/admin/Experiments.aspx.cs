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

public partial class admin_Experiments : System.Web.UI.Page
{
    private int ConstructID 
    {
        get 
        {
            if (Request.QueryString["cid"] != null)
            {
                try
                {
                    return Convert.ToInt32(Request.QueryString["cid"]);
                }
                catch
                {
                    // catch invalid query strings.
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
            if (ConstructID > 0)
            {
                lvExperiments.DataSourceID = "odsExperimentsByConstruct";
                lvExperiments.DataBind();
            }
        }
    }
}

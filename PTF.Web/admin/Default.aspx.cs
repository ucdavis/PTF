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
using System.Web.Services;
using CAESDO.PTF.BLL;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int ValidateConstruct(string constructCode)
    {
        var values = ConstructBLL.GetByCode(constructCode);

        if (values.Count > 0)
        {
            return values[0].ID;
        }
        else
        {
            return -1;
        }
    }

    [WebMethod]
    public static int ValidateExperiment(string experimentCode)
    {
        var values = ExperimentBLL.GetByCode(experimentCode);

        if (values.Count > 0)
        {
            return values[0].ID;
        }
        else
        {
            return -1;
        }
    }
}

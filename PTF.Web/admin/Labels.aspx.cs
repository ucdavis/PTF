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
using System.Collections.Generic;
using CAESDO.PTF.Core.Domain;
using System.Web.Services;
using CAESDO.PTF.BLL;

public partial class Labels : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static void ExportToLabels(List<int> selectedPlants)
    {
        HttpContext.Current.Session["PrintLabels"] = selectedPlants;
    }
}

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

public partial class admin_Billing : System.Web.UI.Page
{
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
        
    }
}

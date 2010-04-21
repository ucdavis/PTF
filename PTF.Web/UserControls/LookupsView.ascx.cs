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

public partial class LookupsView : System.Web.UI.UserControl
{
    public string TypeName { get; set; }
    public string DataObjectTypeName { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        odsLookups.TypeName = TypeName;
        odsLookups.DataObjectTypeName = DataObjectTypeName;
    }
}

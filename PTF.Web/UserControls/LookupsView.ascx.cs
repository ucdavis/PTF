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
    public string ValidationGroup { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        odsLookups.TypeName = TypeName;
        odsLookups.DataObjectTypeName = DataObjectTypeName;
    }

    /// <summary>
    /// Checked when items are created in the list view so we can assign the validation groups for the validators on insert.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lvLookups_OnItemCreated(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.InsertItem)
        {
            ((RequiredFieldValidator)e.Item.FindControl("rfvNewName")).ValidationGroup = this.ValidationGroup;
            ((ImageButton)e.Item.FindControl("ibtnInsert")).ValidationGroup = this.ValidationGroup;
        }
    }
}

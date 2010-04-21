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
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.BLL;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="args"></param>
    protected void PagerCommand(object sender, DataPagerCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Next":
                //  guard against going off the end of the list
                e.NewStartRowIndex = Math.Min(e.Item.Pager.StartRowIndex + e.Item.Pager.MaximumRows, e.Item.Pager.TotalRowCount - e.Item.Pager.MaximumRows);
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Previous":
                //  guard against going off the begining of the list
                e.NewStartRowIndex = Math.Max(0, e.Item.Pager.StartRowIndex - e.Item.Pager.MaximumRows);
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Last":
                //  the
                e.NewStartRowIndex = e.Item.Pager.TotalRowCount - e.Item.Pager.MaximumRows;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "First":
            default:
                e.NewStartRowIndex = 0;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
        }

    }
    protected void lbPageSize10_Click(object sender, EventArgs e)
    {
        var pager = (DataPager)lvOrders.FindControl("pager");

        pager.PageSize = 10;

        lvOrders.DataBind();
    }
    protected void lbPageSize25_Click(object sender, EventArgs e)
    {
        var pager = (DataPager)lvOrders.FindControl("pager");

        pager.PageSize = 25;

        lvOrders.DataBind();
    }
    protected void lbPageSize50_Click(object sender, EventArgs e)
    {
        var pager = (DataPager)lvOrders.FindControl("pager");

        pager.PageSize = 50;

        lvOrders.DataBind();
    }
    protected void lbPageSize100_Click(object sender, EventArgs e)
    {
        var pager = (DataPager)lvOrders.FindControl("pager");

        pager.PageSize = 100;

        lvOrders.DataBind();
    }
}

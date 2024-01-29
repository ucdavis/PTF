using System;
using CAESDO.PTF.BLL;
using CAESDO.PTF.Core.Domain;

public partial class admin_AddSubOrder : System.Web.UI.Page
{
    private const string STR_OrderIDQueryString = "oid";

    private int OrderID
    {
        get
        {
            if (Request.QueryString[STR_OrderIDQueryString] != null)
            {
                try
                {
                    return Convert.ToInt32(Request.QueryString[STR_OrderIDQueryString]);
                }
                catch
                {
                    // catch invalid query strings
                    Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));
                }
            }

            // a valid order id is required for this page
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));

            return -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void lbBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Order.aspx?oid=" + OrderID);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SubOrder subOrder = new SubOrder()
            {
                NumberOfPlants = Convert.ToInt32(tbNumberOfPlants.Text),
                Crop = CropBLL.GetByID(Convert.ToInt32(ddlCrops.SelectedValue)),
                PlantSelection = PlantSelectionBLL.GetByID(Convert.ToInt32(ddlPlantSelection.SelectedValue)),
                GenoType = GenoTypeBLL.GetByID(Convert.ToInt32(ddlGenotype.SelectedValue))
            };

            SubOrderBLL.Update(subOrder);

            Response.Redirect("Order.aspx?oid=" + OrderID);
        }
        catch (Exception)
        {
        }
    }
}

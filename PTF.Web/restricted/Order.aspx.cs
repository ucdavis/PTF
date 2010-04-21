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

public partial class restricted_Order : System.Web.UI.Page
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
        if (!Page.IsPostBack)
        {
            // make sure the current logged in user is the actual owner of the order.  if not redirect to error page with unknown error
            if (!this.ValidateOwner(OrderID))
            {
                Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.UNKNOWN));
            }
            else // validated owner
            {
                PopulateInfoFields();
            }
        }
    }

    protected bool ValidateOwner(int orderID)
    {
        try
        {
            return OrderBLL.ValidateOwner(orderID, (Guid)Membership.GetUser().ProviderUserKey);
        }
        catch (NHibernate.ObjectNotFoundException)
        {
            // order id is not valid
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY));
        }

        return false;
    }

    protected void PopulateInfoFields()
    {

    }
}

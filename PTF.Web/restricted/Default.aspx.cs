﻿using System;
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

public partial class restricted_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void odsOrders_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["currentUser"] = Membership.GetUser().ProviderUserKey;
    }
    protected void lvOrders_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

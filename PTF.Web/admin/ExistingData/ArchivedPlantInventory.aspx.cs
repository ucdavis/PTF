﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ExistingData_ArchivedPlantInventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ReportViewer1.ServerReport.ReportServerUrl = new Uri(System.Web.Configuration.WebConfigurationManager.AppSettings["ReportServer"]);
            ReportViewer1.ServerReport.ReportPath = "/PTF/Archived Plant Inventory";
        }
    }
}

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
using System.Collections.Generic;
using CAESDO.PTF.BLL;

public partial class admin_ExportLabel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var selectedPlants = (List<int>)Session["PrintLabels"];

        List<Plant> plants = new List<Plant>();

        for (int i = 0; i < selectedPlants.Count; i++)
        {
            plants.Add(PlantBLL.GetByID(selectedPlants[i]));
        }

        byte[] byteArray = LabelDocGenerator.GenerateLabelDocument(plants);

        // Send the XML file to the web browser for download.
        Response.Clear();
        Response.AppendHeader("Content-Disposition", "filename=Labels.doc");
        Response.AppendHeader("Content-Length", byteArray.Length.ToString());
        Response.ContentType = "application/octet-stream";
        Response.BinaryWrite(byteArray);
    }
}

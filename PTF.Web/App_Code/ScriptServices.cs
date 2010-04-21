using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using CAESDO.PTF.BLL;
using CAESDO.PTF.Core.Domain;
using System.Web.Script.Services;

/// <summary>
/// Summary description for ScriptServices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
    [ScriptService]
public class ScriptServices : System.Web.Services.WebService
{

    public ScriptServices()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public void SaveProperty(int objID, string property, string value, string objType)
    {
        switch (objType)
        {
            case "Order": SaveProperty(OrderBLL.GetByID(objID), property, value);
                break;
            case "Construct": SaveProperty(ConstructBLL.GetByID(objID), property, value);
                break;
            case "Experiment": SaveProperty(ExperimentBLL.GetByID(objID), property, value);
                break;
            case "Plant": SaveProperty(PlantBLL.GetByID(objID), property, value);
                break;
        }      
    }

    protected void SaveProperty(Order order, string property, string value)
    {
        switch (property)
        {
            case "WorkingBox":
                order.WorkingBox = value;
                break;
            case "ArchivedBox":
                order.ArchiveBox = value;
                break;
            case "Location":
                order.Location = value;
                break;
            case "Position":
                order.Position = value;
                break;
            case "Comment":
                order.Comments = value;
                break;
        };

        OrderBLL.Update(order);
    }

    protected void SaveProperty(Construct construct, string property, string value)
    {
        switch (property)
        {
            case "Comment": construct.Comments = value;
                break;
        };

        ConstructBLL.Update(construct);
    }

    protected void SaveProperty(Experiment experiment, string property, string value)
    {
        switch (property)
        {
            case "Comment": experiment.Comments = value;
                break;
        };

        ExperimentBLL.Update(experiment);
    }

    protected void SaveProperty(Plant plant, string property, string value)
    {
        switch (property)
        {
            case "PlantComment": plant.Comments = value;
                break;
        };

        PlantBLL.Update(plant);
    }
}


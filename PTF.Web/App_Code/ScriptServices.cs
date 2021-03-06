﻿using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using CAESDO.PTF.BLL;
using CAESDO.PTF.Core.Domain;
using System.Web.Script.Services;
using System.Web.Security;
using System.Collections.Generic;
using System.Xml;

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

    #region Generic Methods

    [WebMethod]
    public string SaveProperty(int objID, string property, string value, string objType)
    {
        try
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
                case "Suborder": SaveProperty(SubOrderBLL.GetByID(objID), property, value);
                    break;
            }

            return string.Empty;
        }
        catch (Exception ex)
        {
            throw ex;
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
            case "ContractNumber":
                order.ContractNumber = value;
                break;
            case "ShippingPermit":
                order.ShippingPermit = value;
                break;
            case "AgroStrain":
                order.AgroStrain = AgroStrainBLL.GetByID(Convert.ToInt32(value));
                break;
        };

        OrderBLL.Update(order);
    }

    protected void SaveProperty(SubOrder suborder, string property, string value)
    {
        switch (property)
        {
            case "PlantSelection": suborder.PlantSelection = PlantSelectionBLL.GetByID(Convert.ToInt32(value));
                break;
            case "Genotype": suborder.GenoType = GenoTypeBLL.GetByID(Convert.ToInt32(value));
                break;
            case "NumberOfPlants": suborder.NumberOfPlants = Convert.ToInt32(value);
                break;
        };

        SubOrderBLL.Update(suborder);
    }

    protected void SaveProperty(Construct construct, string property, string value)
    {
        switch (property)
        {
            case "Comment": construct.Comments = value;
                break;
            case "Recharge": construct.RechargeAmount = decimal.Parse(value);
                break;
            case "IsLocked":
                if (construct.IsLocked)
                {
                    //construct.IsLocked = false;
                    ConstructBLL.UnLock(construct);
                }
                else
                {
                    //construct.IsLocked = true;
                    ConstructBLL.Lock(construct);
                }

                return;
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

    #endregion

    #region Admin/Orders.aspx
    [WebMethod]
    public void SaveContractNumber(int orderID, string contractNumber)
    {
        var order = OrderBLL.GetByID(orderID);

        order.ContractNumber = contractNumber;

        OrderBLL.Update(order);
    }
    #endregion

    #region Admin/Constructs.aspx
    #endregion

    #region Admin/Labels.aspx
    //[WebMethod]
    //public void ExportLabels(List<int> plantIDs)
    //{
    //    List<Plant> plants = new List<Plant>();

    //    for (int i = 0; i < plantIDs.Count; i++)
    //    {
    //        plants.Add(PlantBLL.GetByID(plantIDs[i]));
    //    }

    //    HttpContext.Current.Session["PrintLabels"] = plants;
    //}
    #endregion

    #region Admin/Experiments.aspx
    [WebMethod]
    public ChangeStatusReturn SaveChangeStatus(int plantID, int statusID)
    {
        PlantBLL.ChangeStatus(PlantBLL.GetByID(plantID), StatusBLL.GetByID(statusID));

        // shipped status
        if (StatusBLL.GetByID(statusID).Name == StatusText.STR_Shipped)
        {
            return new ChangeStatusReturn { IsComplete = true, ReturnText = DateTime.Now.ToString("d") };
        }
        // any completed status
        else if (StatusBLL.GetByID(statusID).IsComplete)
        {
            return new ChangeStatusReturn { IsComplete = true, ReturnText = string.Empty };
        }
        // any not complete status
        else
        {
            return new ChangeStatusReturn { IsComplete = false, ReturnText = string.Empty };
        }
    }

    [WebMethod]
    public ChangeStatusReturn SaveRecallusingAssay(int plantID, bool recallusing)
    {
        PlantBLL.ChangeRecallusingAssay(PlantBLL.GetByID(plantID), recallusing);

        return new ChangeStatusReturn { IsComplete = false, ReturnText = string.Empty };
    }

    [WebMethod]
    public ChangeStatusReturn SaveRooting(int plantID, bool rooting)
    {
        PlantBLL.ChangeRooting(PlantBLL.GetByID(plantID), rooting);

        return new ChangeStatusReturn { IsComplete = false, ReturnText = string.Empty };
    }
    #endregion

    #region Admin/Billing.aspx
    [WebMethod]
    public void Bill(int constructId, string dafisDoc)
    {
        var construct = ConstructBLL.GetByID(constructId);
        construct.DafisDoc = dafisDoc;
        ConstructBLL.Bill(construct);
    }
    #endregion

    #region restricted/Order.aspx
    [WebMethod]
    public void SaveShippingPermit(int orderID, string shippingPermit)
    {
        var order = OrderBLL.GetByID(orderID);

        order.ShippingPermit = shippingPermit;

        OrderBLL.Update(order);
    }
    #endregion

    #region restricted/Account.aspx
    [WebMethod]
    public void SaveProfile(string address1, string address2, string city, string state, string internationalState, string zip, string country)
    {
        var profile = UserProfileBLL.GetByUserID((Guid)Membership.GetUser().ProviderUserKey);

        profile.Address1 = !string.IsNullOrEmpty(address1) ? address1 : null;
        profile.Address2 = !string.IsNullOrEmpty(address2) ? address2 : null;
        profile.City = !string.IsNullOrEmpty(city) ? city : null;
        profile.State = !string.IsNullOrEmpty(state) && state != "-1" ? StateBLL.GetByID(state) : null;
        profile.InternationalState = !string.IsNullOrEmpty(internationalState) ? internationalState : null;
        profile.Zip = !string.IsNullOrEmpty(zip) ? zip : null;
        profile.Country = !string.IsNullOrEmpty(country) ? CountryBLL.GetByID(country) : null;

        UserProfileBLL.Update(profile);
    }
    #endregion
}

public class ChangeStatusReturn
{
    public bool IsComplete { get; set; }
    public string ReturnText { get; set; }
}
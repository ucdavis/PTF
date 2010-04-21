using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using AjaxControlToolkit;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.BLL;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web.Script.Services;

/// <summary>
/// Summary description for PTFWS
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class PTFWS : System.Web.Services.WebService
{

    public PTFWS()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetCrops(string knownCategoryValues, string category)
    {
        var values = new List<CascadingDropDownNameValue>();

        foreach (Crop c in CropBLL.GetActive())
        {
            values.Add(new CascadingDropDownNameValue(c.Name, c.ID.ToString()));
        }

        return values.ToArray();
    }
    [WebMethod]
    public CascadingDropDownNameValue[] GetPlantSelectionForCrops(string knownCategoryValues, string category)
    {
        var values = new List<CascadingDropDownNameValue>();

        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cropID;
        if (!kv.ContainsKey("Crop") || !Int32.TryParse(kv["Crop"], out cropID))
        {
            return null;
        }

        foreach (PlantSelection ps in CropBLL.GetByID(cropID).PlantSelections)
        {
            values.Add(new CascadingDropDownNameValue(ps.Name, ps.ID.ToString()));
        }

        return values.ToArray();
    }
    [WebMethod]
    public CascadingDropDownNameValue[] GetGenotypeForCrops(string knownCategoryValues, string category)
    {
        var values = new List<CascadingDropDownNameValue>();

        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cropID;
        if (!kv.ContainsKey("Crop") || !Int32.TryParse(kv["Crop"], out cropID))
        {
            return null;
        }

        foreach (GenoType gt in CropBLL.GetByID(cropID).GenoTypes)
        {
            values.Add(new CascadingDropDownNameValue(gt.Name, gt.ID.ToString()));
        }

        return values.ToArray();
    }
}


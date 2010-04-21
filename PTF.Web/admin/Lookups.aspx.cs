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
using CAESDO.PTF.Core.Domain;
using System.Web.Services;
using System.Collections.Generic;

public partial class Lookups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlCrops_OnSelectedIndexChange(object sender, EventArgs e)
    {
        var dropDown = (DropDownList)sender;
        int cropID = Convert.ToInt32(dropDown.SelectedValue);

        // blank out existing checked things
        foreach (ListItem li in cblPlantSelections.Items)
        {
            li.Selected = false;
        }

        if (cropID != -1)
        {
            var crop = CropBLL.GetByID(cropID);

            foreach (PlantSelection ps in crop.PlantSelections)
            {
                foreach (ListItem li in cblPlantSelections.Items)
                {
                    if (Convert.ToInt32(li.Value) == ps.ID)
                    {
                        li.Selected = true;
                    }
                }
            }

            cblPlantSelections.Style["display"] = "block";
            lbSaveCropPlantSelection.Visible = true;
        }
        else
        {
            cblPlantSelections.Style["display"] = "none";
            lbSaveCropPlantSelection.Visible = false;
        }
    }
    protected void lbSaveCropPlantSelection_OnClick(object sender, EventArgs e)
    {
        int cropID = Convert.ToInt32(ddlCrops.SelectedValue);

        var crop = CropBLL.GetByID(cropID);

        foreach (ListItem li in cblPlantSelections.Items)
        {
            var ps = PlantSelectionBLL.GetByID(Convert.ToInt32(li.Value));

            // selected make sure it's in the list
            if (li.Selected)
            {
                // not in the list add it in
                if (!crop.PlantSelections.Contains(ps))
                {
                    crop.PlantSelections.Add(ps);
                }
            }
            else // not selected, make sure it isn't in the list
            {
                // contained, remove it from the list
                if (crop.PlantSelections.Contains(ps))
                {
                    crop.PlantSelections.Remove(ps);
                }
            }
        }

        // update hte crop object
        CropBLL.Update(crop);
    }

    protected void ddlCropsGenoTypeAssociation_OnSelectedIndexChange(object sender, EventArgs e)
    {
        var dropDown = (DropDownList)sender;
        int cropID = Convert.ToInt32(dropDown.SelectedValue);

        foreach (ListItem li in cblGenoTypes.Items)
        {
            li.Selected = false;
        }

        if (cropID != -1)
        {
            var crop = CropBLL.GetByID(cropID);

            foreach (GenoType gt in crop.GenoTypes)
            {
                foreach (ListItem li in cblGenoTypes.Items)
                {
                    if (Convert.ToInt32(li.Value) == gt.ID)
                    {
                        li.Selected = true;
                    }
                }
            }

            cblGenoTypes.Style["display"] = "block";
            lbSaveCropGenoTypes.Visible = true;
        }
        else
        {
            cblGenoTypes.Style["display"] = "none";
            lbSaveCropGenoTypes.Visible = false;
        }
    }
    protected void lbSaveCropGenoTypes_OnClick(object sender, EventArgs e)
    {
        int cropID = Convert.ToInt32(ddlCropsGenoTypeAssociation.SelectedValue);
        var crop = CropBLL.GetByID(cropID);

        foreach (ListItem li in cblGenoTypes.Items)
        {
            var gt = GenoTypeBLL.GetByID(Convert.ToInt32(li.Value));

            if (li.Selected)
            {
                // not in the list so add it in
                if (!crop.GenoTypes.Contains(gt))
                {
                    crop.GenoTypes.Add(gt);
                }
                else // not selected, make sure it isn't in the list
                {
                    // contained, remove it from the list
                    if (crop.GenoTypes.Contains(gt))
                    {
                        crop.GenoTypes.Remove(gt);
                    }
                }
            }
        }

        // update the crop object
        CropBLL.Update(crop);
    }
}

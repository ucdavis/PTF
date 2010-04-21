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
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        CAESDO.PTF.Core.Domain.Construct construct = new CAESDO.PTF.Core.Domain.Construct()
            {
                PlantsRequested = tbPlantsRequested.Text,
                PIConstructName = tbPIConstructName.Text,
                PICode = tbPICode.Text,
                AgroStrain = AgroStrainBLL.GetByID(Convert.ToInt32(ddlAgroStrain.SelectedValue)),
                BacterialSelection = tbBacterialSelection.Text,
                Plasmid = tbPlasmid.Text,
                Trait = tbTrait.Text,
                GeneOfInterest = tbGeneofInterest.Text,
                SelectableMarker = SelectableMarkerBLL.GetByID(Convert.ToInt32(ddlSelectableMarker.SelectedValue)),
                Crop = CropBLL.GetByID(Convert.ToInt32(ddlCrop.SelectedValue)),
                Genotype = GenoTypeBLL.GetByID(Convert.ToInt32(ddlGenotype.SelectedValue)),
                DateReceived = DateTime.Parse(tbDateReceived.Text),
                Comments = tbComment.Text,
                Order = OrderBLL.GetByID(Convert.ToInt32(tbOrderID.Text))
            };

        decimal parsedRecharge;

        if (decimal.TryParse(tbRechargeAmount.Text, out parsedRecharge))
        {
            construct.RechargeAmount = parsedRecharge;
        }

        // update the list view to reflect the new construct
        lvOrders.DataBind();

        // reset the boxes in the popup.

    }
}

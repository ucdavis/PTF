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
using Resources;
using System.Web.Services;

public partial class admin_Experiment : System.Web.UI.Page
{
    private const string STR_ExperimentIDQueryString = "eid";
    private const string STR_ConstructLink = "Construct.aspx?cid={0}";

    private int ExperimentID
    {
        get
        {
            if (Request.QueryString[STR_ExperimentIDQueryString] != null)
            {
                try
                {
                    return Convert.ToInt32(Request.QueryString[STR_ExperimentIDQueryString]);
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
            PopulateInfoFields();

            if (User.IsInRole("Reader"))
            {
                btnAddPlant.Visible = false;
                btnMakeNote.Visible = false;
            }
        }
    }

    protected void PopulateInfoFields()
    {
        try
        {
            var experiment = ExperimentBLL.GetByID(ExperimentID);

            litExperimentCode.Text = experiment.ExperimentCode;
            litConstructCode.Text = experiment.Construct.ConstructCode;
            litOperator.Text = experiment.Operator.OperatorName;
            litDateStarted.Text = ((DateTime)experiment.DateStarted).ToString("d");
            litSeedLotNum.Text = experiment.SeedLotNumber;
            litTargetNumPlants.Text = experiment.Construct.SubOrder.NumberOfPlants.ToString();
            litTrait.Text = experiment.Construct.Order.Trait;
            litGenotype.Text = experiment.Construct.SubOrder.GenoType.Name;
            litExplant.Text = experiment.Explant;
            litOpticalDensity.Text = experiment.OpticalDensity.ToString();
            litCrop.Text = experiment.Construct.SubOrder.Crop.Name;

            litPIName.Text = experiment.Construct.Order.PI;
            litPICode.Text = experiment.Construct.Order.PICode;
            litContactEmail.Text = experiment.Construct.Order.ContactEmail;

            tbComments.Text = experiment.Comments;

            lvInduction.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Induction);
            lvInduction.DataBind();

            lvElongationGermination.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.ElongationGermination);
            lvElongationGermination.DataBind();

            lvRecallusing.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Recallusing);
            lvRecallusing.DataBind();

            lvRooting.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Rooting);
            lvRooting.DataBind();

            lvCoCulture.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.CoCulture);
            lvCoCulture.DataBind();

            lvPlants.DataSource = experiment.Plants;
            lvPlants.DataBind();

            // place the contract warning
            if (string.IsNullOrEmpty(experiment.Construct.Order.ContractNumber) && experiment.Construct.Order.RequiresContract)
            {
                litContractNotExecuted.Text = CommonStrings.STR_ContractNotExecutedWarning;

                // disable the add plant option
                btnAddPlant.Enabled = false;
            }

            // disable changes if construct has been billed
            if (experiment.Construct.IsLocked)
            {
                btnAddPlant.Enabled = false;
                btnMakeNote.Enabled = false;
            }
        }
        catch 
        {
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.QUERY)); 
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        var experiment = ExperimentBLL.GetByID(ExperimentID);

        Note note = new Note()
        {
            NoteText = tbNote.Text,
            NoteType = NoteTypeBLL.GetByID(Convert.ToInt32(ddlNoteType.SelectedValue)),
            Experiment = experiment
        };

        NoteBLL.Insert(note);

        lvInduction.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Induction);
        lvInduction.DataBind();

        lvElongationGermination.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.ElongationGermination);
        lvElongationGermination.DataBind();

        lvRecallusing.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Recallusing);
        lvRecallusing.DataBind();

        lvRooting.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Rooting);
        lvRooting.DataBind();

        lvCoCulture.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.CoCulture);
        lvCoCulture.DataBind();

        // clear out the modal controls
        ddlNoteType.SelectedIndex = -1;
        tbNote.Text = string.Empty;
    }
    protected void btnAddPlant_Click(object sender, EventArgs e)
    {
        Plant plant = new Plant()
        {
            Experiment = ExperimentBLL.GetByID(ExperimentID)
        };

        PlantBLL.Insert(plant);

        Experiment experiment = ExperimentBLL.GetByID(ExperimentID);
        lvPlants.DataSource = experiment.Plants;
        lvPlants.DataBind();
    }
    protected void lbBack_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Construct.aspx?cid=" + ExperimentBLL.GetByID(ExperimentID).Construct.ID.ToString(), true);
        Response.Redirect(string.Format(STR_ConstructLink, ExperimentBLL.GetByID(ExperimentID).Construct.ID.ToString()), true);
    }

    protected void lvPlants_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            var ddl = (DropDownList)e.Item.FindControl("ddlChangeStatus");

            var currentItem = (ListViewDataItem)e.Item;
            var plant = (Plant)currentItem.DataItem;

            // check to see if the status is in the drop down list
            if (ddl.Items.FindByValue(plant.Status.ID.ToString()) == null)
            {
                var lit = (Literal)e.Item.FindControl("litStatus");

                lit.Visible = true;
                lit.Text = plant.Status.Name;
            }
            else
            {
                // deal with the situation where it is in the drop down
                ddl.SelectedValue = plant.Status.ID.ToString();
            }

            // disable the controls
            if (User.IsInRole("Reader"))
            {
                ddl.Enabled = false;
                var recallusing = (CheckBox)e.Item.FindControl("cbRecallusingAssay");
                recallusing.Enabled = false;
                var rooting = (CheckBox)e.Item.FindControl("cbRooting");
                rooting.Enabled = false;
            }
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        var experiment = ExperimentBLL.GetByID(ExperimentID);
        var constructId = experiment.Construct.ID;

        ExperimentBLL.Delete(experiment);

        Response.Redirect(string.Format(STR_ConstructLink, constructId));
    }
}


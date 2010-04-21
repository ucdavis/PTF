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

public partial class admin_Experiment : System.Web.UI.Page
{
    private const string STR_ExperimentIDQueryString = "eid";

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
        }
    }

    protected void PopulateInfoFields()
    {
        try
        {
            var experiment = ExperimentBLL.GetByID(ExperimentID);

            litExperimentCode.Text = experiment.ExperimentCode;
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

            lvInduction.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Induction);
            lvInduction.DataBind();

            lvElongationGermination.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.ElongationGermination);
            lvElongationGermination.DataBind();

            lvRecallusing.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Recallusing);
            lvRecallusing.DataBind();

            lvRooting.DataSource = experiment.GetNotesbyType(Note.ExpNoteTypes.Rooting);
            lvRooting.DataBind();

            lvPlants.DataSource = experiment.Plants;
            lvPlants.DataBind();

            // place the contract warning
            if (!experiment.Construct.Order.ContractExecuted && experiment.Construct.Order.RequiresContract)
            {
                litContractNotExecuted.Text = CommonStrings.STR_ContractNotExecutedWarning;

                // disable the add plant option
                btnAddPlant.Enabled = false;
            }
        }
        catch (NHibernate.ObjectNotFoundException onfe)
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
    protected void btnSaveChangeStatus_Click(object sender, EventArgs e)
    {
        PlantBLL.ChangeStatus(PlantBLL.GetByID(Convert.ToInt32(tbPlantID.Text)), StatusBLL.GetByID(Convert.ToInt32(ddlStatus.SelectedValue)));        

        //rebind the grid
        lvPlants.DataSource = ExperimentBLL.GetByID(ExperimentID).Plants;
        lvPlants.DataBind();
    }
}

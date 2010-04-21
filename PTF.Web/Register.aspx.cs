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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void wizCreateUser_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        MembershipCreateStatus status;

        //Only proceed if all of the fields are valid
        if (EmailRequired.IsValid && PasswordCompare.IsValid && PasswordRequired.IsValid && QuestionRequired.IsValid && AnswerRequired.IsValid)
        {
            MembershipUser user = Membership.CreateUser(Email.Text, Password.Text, Email.Text, Question.Text, Answer.Text, true, out status);
            //MembershipUser user = Membership.CreateUser(Email.Text, Password.Text, Email.Text, "Q", "A", true, out status);

            switch (status)
            {
                case MembershipCreateStatus.DuplicateEmail:
                    ErrorMessage.Text = "The e-mail address that you entered is already in use. Please enter a different e-mail address.";
                    e.Cancel = true;
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    ErrorMessage.Text = string.Format("Password length minimum: {0}. Non-alphanumeric characters required: {1}.", Membership.MinRequiredPasswordLength, Membership.MinRequiredNonAlphanumericCharacters);
                    e.Cancel = true;
                    break;
                case MembershipCreateStatus.Success:

                    // create the user profile
                    UserProfileBLL.CreateProfile((Guid)user.ProviderUserKey);

                    FormsAuthentication.RedirectFromLoginPage(Email.Text, false);
                    //Response.Redirect(FormsAuthentication.DefaultUrl);
                    break;
                default:
                    ErrorMessage.Text = "Your account was not created. Please try again.";
                    e.Cancel = true;
                    break;
            }
        }
    }
}

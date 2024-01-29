using System;
using System.Web.Security;
using System.Web.UI.WebControls;
using CAESDO.PTF.BLL;

public partial class admin_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //#region Clients
    //protected void lbReset_Command(object sender, CommandEventArgs e)
    //{
    //    Guid key = new Guid(e.CommandArgument.ToString());

    //    var u = Membership.GetUser(key);
        
    //    // generate the new password
    //    string guidResult = System.Guid.NewGuid().ToString();
    //    guidResult = guidResult.Replace("-", string.Empty);

    //    var user = Membership.Providers["AspNetSqlMembershipProviderOther"].GetUser(u.UserName, false);
    //    //user.ChangePassword(user.ResetPassword(), )

    //    var password = user.ResetPassword();


    //    ////var newPassword = user.ResetPassword(
       
    //    //var newPassword = user.ResetPassword();
    //    //user.

    //    EmailBLL.ResetPasswordEmail(key, password);

    //    Response.Write("Password for " + user.UserName + " has been reset.");
    //}
    //protected void lbUnlock_Command(object sender, CommandEventArgs e)
    //{
    //    Guid key = new Guid(e.CommandArgument.ToString());

    //    var user = Membership.GetUser(key);
    //    user.UnlockUser();

    //    gvClients.DataBind();
    //}
    //#endregion

    //#region Staff
    //protected void lvStaffUsers_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    // get the login id
    //    ListView lview = (ListView)sender;

    //    string selectedLoginID = lview.SelectedDataKey["Login"].ToString();

    //    // get user's corresponding object
    //    CAESDO.PTF.Core.Domain.User selectedUser = UserBLL.GetByLogin(selectedLoginID);

    //    // fill in the user info fields
    //    lblUserInfoName.Text = string.Format("{0} {1}", selectedUser.FirstName, selectedUser.LastName);

    //    lblUserInfoLoginID.Text = selectedLoginID;
    //    lblUserInfoEmployeeID.Text = selectedUser.EmployeeID;

    //    lvUserUnits.DataSource = selectedUser.Units;
    //    lvUserUnits.DataBind();

    //    lvUserRoles.DataSource = CatbertManager.GetRolesByUser(selectedLoginID);
    //    lvUserRoles.DataBind();

    //    mpeUpdateUserInfo.Show();

    //}

    //protected void btnAddUserSearch_Click(object sender, EventArgs e)
    //{
    //    //Show the gridview results
    //    lvViewAddUserSearch.Visible = true;
    //    mpeNewUser.Show();
    //}
    //protected void lvViewAddUserSearch_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ListView lview = (ListView)sender;

    //    // insert the new user
    //    string loginID = lview.SelectedDataKey["Login"] as string;

    //    int userID = -1;

    //    // check to see if the user is already in catbert
    //    if (CatbertManager.VerifyUser(loginID) == false)
    //    {
    //        userID = CatbertManager.InsertNewUser(loginID);
    //    }
    //    else
    //    {
    //        userID = 0;
    //    }

    //    // Add the user to the given role/unit
    //    DropDownList unit = lview.Items[lview.SelectedIndex].FindControl("ddlAddUserUnit") as DropDownList;
    //    DropDownList role = lview.Items[lview.SelectedIndex].FindControl("ddlAddUserRole") as DropDownList;

    //    if (userID == -1 || unit == null || role == null)
    //    {
    //        lblAddUserStatus.ForeColor = System.Drawing.Color.Red;
    //        lblAddUserStatus.Text = "User " + loginID + " not added: Check your role and unit selection and try again";
    //    }
    //    else
    //    {
    //        CatbertManager.AddUserToRole(loginID, int.Parse(role.SelectedValue));
    //        CatbertManager.AddUserToUnit(loginID, int.Parse(unit.SelectedValue));

    //        lblAddUserStatus.ForeColor = System.Drawing.Color.Green;
    //        lblAddUserStatus.Text = "User " + loginID + " successfully added";
    //    }

    //    lvViewAddUserSearch.SelectedIndex = -1;
    //    lvViewAddUserSearch.Visible = false;

    //    lvStaffUsers.DataBind();

    //    // keep the modal up
    //    mpeNewUser.Show();
    //}
    //protected void lvUserUnits_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{
    //    ListView lview = (ListView)sender;

    //    bool success = CatbertManager.RemoveUserFromUnit(lblUserInfoLoginID.Text, (int)lvUserUnits.DataKeys[e.ItemIndex].Value);

    //    CAESDO.PTF.Core.Domain.User selectedUser = UserBLL.GetByLogin(lblUserInfoLoginID.Text);

    //    lvUserUnits.DataSource = selectedUser.Units;
    //    lvUserUnits.DataBind();

    //    mpeUpdateUserInfo.Show();
    //}
    //protected void lvUserRoles_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    //{
    //    ListView lview = (ListView)sender;

    //    //Remove the user from the desired unit
    //    bool success = CatbertManager.RemoveUserFromRole((int)lview.DataKeys[e.ItemIndex].Value, lblUserInfoLoginID.Text);

    //    //update the grid
    //    lvUserRoles.DataSource = CatbertManager.GetRolesByUser(lblUserInfoLoginID.Text);
    //    lvUserRoles.DataBind();

    //    // update the staff grid too
    //    lvStaffUsers.DataBind();

    //    mpeUpdateUserInfo.Show();
    //}
    //protected void btnAddUserUnit_Click(object sender, EventArgs e)
    //{
    //    //Add the user to the desired unit
    //    bool success = CatbertManager.AddUserToUnit(lblUserInfoLoginID.Text, int.Parse(ddlUnits.SelectedValue));
    //    //update the grid
    //    CAESDO.PTF.Core.Domain.User selectedUser = UserBLL.GetByLogin(lblUserInfoLoginID.Text);

    //    lvUserUnits.DataSource = selectedUser.Units;
    //    lvUserUnits.DataBind();

    //    mpeUpdateUserInfo.Show();
    //}

    //protected void btnAddUserRole_Click(object sender, EventArgs e)
    //{
    //    bool success = CatbertManager.AddUserToRole(lblUserInfoLoginID.Text, int.Parse(ddlRoles.SelectedValue));

    //    CAESDO.PTF.Core.Domain.User selectedUser = UserBLL.GetByLogin(lblUserInfoLoginID.Text);

    //    lvUserRoles.DataSource = CatbertManager.GetRolesByUser(lblUserInfoLoginID.Text);
    //    lvUserRoles.DataBind();

    //    mpeUpdateUserInfo.Show();
    //}

    //#endregion
}

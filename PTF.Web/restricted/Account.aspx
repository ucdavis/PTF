<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="restricted_Account" Title="PTF | User Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../JS/AddressScripts.js"></script>

<script type="text/javascript">                
function onCountryChange(ddl)
{
    var index = ddl.selectedIndex;
    var value = ddl.options[index].value;
    
    ChangeCountry(value, $get('<%= ddlState.ClientID %>'), $get('<%= tbInternationalState.ClientID %>'));
}

function SaveProfile()
{
    var warningString = str_empty;               

    Page_ClientValidate("ProfileSave");  // validate the other controls    

    var countryDDL = $get('<%= ddlCountry.ClientID %>');
    var stateDDL = $get('<%= ddlState.ClientID %>');
    var stateTB = $get('<%= tbInternationalState.ClientID %>');

    if (ValidateCountryState(countryDDL, stateDDL, stateTB))
    {
        $get("StateWarning").style.display = str_none;
        $get("ValidationWarnings").style.display = str_none;
        $get("ValidationWarnings").innerHTML = "";
        
        // save
        ScriptServices.SaveProfile($get('<%= tbAddress1.ClientID %>').value,
            $get('<%= tbAddress2.ClientID %>').value,
            $get('<%= tbCity.ClientID %>').value,
            stateDDL.options[stateDDL.selectedIndex].value,
            $get('<%= tbInternationalState.ClientID %>').value,
            $get('<%= tbZip.ClientID %>').value,
            countryDDL.options[countryDDL.selectedIndex].value,
            SaveProfileOnComplete
            );
    }
    else
    {
        // show validation warnings
        $get("StateWarning").style.display = str_inline;
        $get("ValidationWarnings").style.display = str_inline;
        $get("ValidationWarnings").innerHTML = "<ul><li>State is required.</li></ul>";
    }
}

function SaveProfileOnComplete ()
{
    $get("ValidationWarnings").innerHTML = "Save successful!";
    $get("ValidationWarnings").style.display = "inline";
}
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="ChangePassword" class="noStyle">
        <asp:ChangePassword ID="ChangePassword1" runat="server" CssClass="noStyle">
            <ChangePasswordTemplate>
                <table border="0" cellpadding="1" cellspacing="0" 
                    style="border-collapse:collapse;" class="noStyle">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" class="noStyle">
                                <tr>
                                    <th colspan="2">
                                        <h2>Change Your Password</h2></td>
                                </tr>
                                <tr>
                                    <td class="InfoFieldName">
                                        <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                            AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                    </td>
                                    <td class="InfoFieldValue">
                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                            ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="InfoFieldName">
                                        <asp:Label ID="NewPasswordLabel" runat="server" 
                                            AssociatedControlID="NewPassword">New Password:</asp:Label>
                                    </td>
                                    <td class="InfoFieldValue">
                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                            ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                            ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="InfoFieldName">
                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                            AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                    </td>
                                    <td class="InfoFieldValue">
                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                            ControlToValidate="ConfirmNewPassword" 
                                            ErrorMessage="Confirm New Password is required." 
                                            ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                            Display="Dynamic" 
                                            ErrorMessage="The Confirm New Password must match the New Password entry." 
                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:ImageButton ID="ChangePasswordPushButton" runat="server" 
                                            CommandName="ChangePassword" ImageUrl="~/Images/btn_changepassword.png" Text="Change Password" 
                                            ValidationGroup="ChangePassword1" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="CancelPushButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" ImageUrl="~/Images/btn_cancel.png" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ChangePasswordTemplate>
        </asp:ChangePassword>
    </div>
<br /><br />
    <div id="Profile">
        <table class="noStyle">
                                <tr>
                                    <th colspan="2">
                                        <h2>Update Your Information</h2></td>
                                </tr>
            <tr>
                <td class="InfoFieldName">Address Line 1:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbAddress1" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ErrorMessage="Address 1 is required." Text="*" ControlToValidate="tbAddress1" ValidationGroup="ProfileSave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Address Line 2:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbAddress2" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">City:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbCity" runat="server" Width="160px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required." Text="*" ControlToValidate="tbCity" ValidationGroup="ProfileSave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">State:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbInternationalState" runat="server" style="display:none;" Width="160px" MaxLength="50"></asp:TextBox>
                    <asp:DropDownList ID="ddlState" runat="server" DataSourceID="odsState" 
                        DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true" Enabled="false">
                        <asp:ListItem Text="--Select a State--" Value="-1" />
                    </asp:DropDownList>
                    <span id="StateWarning" style="color:Red; display:none;">*</span>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Zip:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbZip" runat="server" Width="160px" MaxLength="12"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip is required." Text="*" ControlToValidate="tbZip" ValidationGroup="ProfileSave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Country:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" 
                        DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true" onChange="onCountryChange(this);">
                        <asp:ListItem Text="--Select a Country--" Value="-1" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Country is required." Text="*" InitialValue="-1" ControlToValidate="ddlCountry" ValidationGroup="ProfileSave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ProfileSave" />                   
                    <asp:ImageButton ID="btnSaveAddress" runat="server" Text="Update Profile" ImageUrl="~/Images/btn_updateprofile.png" ValidationGroup="ProfileSave" OnClientClick="SaveProfile(); return false" />
                    <div id="ValidationWarnings" style="display:none; color:Red;"></div>
                </td>
            </tr>
        </table>
    </div>

    <asp:ObjectDataSource ID="odsState" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.StateBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CountryBLL"></asp:ObjectDataSource>
</asp:Content>


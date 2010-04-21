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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" class="noStyle">

    <div id="ChangePassword" class="noStyle">
        <asp:ChangePassword ID="ChangePassword1" runat="server" class="noStyle">
        </asp:ChangePassword>
    </div>
<br /><br />
    <div id="Profile">
        <table class="noStyle">
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
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ProfileSave" />                   
                    <asp:ImageButton ID="btnSaveAddress" runat="server" Text="Save" ImageUrl="~/Images/save.png" Width="20px" ValidationGroup="ProfileSave" OnClientClick="SaveProfile(); return false" />
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


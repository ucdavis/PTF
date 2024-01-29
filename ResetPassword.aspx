<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" CssClass="noStyle">
        <UserNameTemplate>
            <h2>Forgot Your Password?</h2>
            
            Enter your User Name to receive your password.<br /><br />
            
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"><strong>User 
            Name:</strong>&nbsp;</asp:Label> 
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                 ControlToValidate="UserName" ErrorMessage="User Name is required." 
                 ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
            <br />
            <span class="red"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
            <br />
            <asp:ImageButton ID="SubmitButton" runat="server" CommandName="Submit" AlternateText="Submit" 
                                        ValidationGroup="PasswordRecovery1" ImageUrl="~/Images/btn_submit.png" />
                               
        </UserNameTemplate>
    </asp:PasswordRecovery>
</asp:Content>


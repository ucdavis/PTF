﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="PTF | Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3 class="secure"><img src="Images/lock.png" alt="lock" style="float: left; width: 64px; height: 64px;" /><br />You have requested<br />a secure UC Davis Web page.</h3>
    
    <asp:Panel ID="pnlKerberosLogin" runat="server">
    <h2><asp:LinkButton ID="lbtnKerberosLogin" CssClass="kerberos" runat="server" OnClick="lbtnKerberosLogin_Click">Have a Kerberos ID? Log in here.&nbsp;&nbsp;<img src="Images/arrow_right.png" alt="right" /></asp:LinkButton></h2>
    
    </asp:Panel>
    <asp:Login ID="Login1" runat="server" CssClass="noStyle">
        <LayoutTemplate>
            <table border="0" cellpadding="1" cellspacing="0" 
                style="border-collapse:collapse;" class="noStyle">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" class="noStyle login">
                            <tr class="head">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td rowspan="6" class="register">
                                <a href="Register.aspx" title="Register">[Register]</a></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">E-mail: </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password: </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:ImageButton ID="LoginButton" runat="server" CommandName="Login" ImageUrl="Images/btn_login.png" Text="Log In" 
                                        ValidationGroup="Login1" />
    <a href="ResetPassword.aspx" title="Forgot your password?"><img src="Images/btn_forgotpassword.png" /></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    

</asp:Content>


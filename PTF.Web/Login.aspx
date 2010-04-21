<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    &nbsp;You have requested a secure UC Davis Web page.&nbsp;
    <br />
    <br />
    <asp:Panel ID="pnlKerberosLogin" runat="server">
    
    <asp:LinkButton ID="lbtnKerberosLogin" runat="server" OnClick="lbtnKerberosLogin_Click">If you have a Kerberos ID, click here to login.</asp:LinkButton><br />
    <br />
    OR<br />
    <br />
    </asp:Panel>
    <asp:Login ID="Login1" runat="server">
    </asp:Login>

</asp:Content>


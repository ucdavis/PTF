<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="PTF | Order System" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        <h2>The Facility is no longer accepting orders from outside the University of California System.</h2>
    </p>
<br />
<a href="admin/Default.aspx" title="Administrators"><img src="Images/menu_admin.png" alt="Administrators" /></a>
<br /><br />
<a href="restricted/Default.aspx" title="Clients"><img src="Images/menu_clients.png" alt="Clients" /></a>
<br /><br />
<a href="Register.aspx" title="Register for an Account"><img src="Images/menu_register.png" alt="Register for an Account" /></a>
</asp:Content>


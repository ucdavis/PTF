<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" Title="PTF | Administrative Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <ul style="list-style-type:none;">
    <li><a href=Orders.aspx>Orders</a></li>
    <li><a href=Lookups.aspx>Lookups</a></li>
    <li><a href=Operators.aspx>Operators</a></li>
    <li><a href=Users.aspx>Users</a></li>
    <li><a href=Reports.aspx>Reports</a></li>
    </ul>
</asp:Content>


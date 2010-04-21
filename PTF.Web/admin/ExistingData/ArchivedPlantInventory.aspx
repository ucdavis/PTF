<%@ Page Title="PTF | Plant Inventory" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArchivedPlantInventory.aspx.cs" Inherits="admin_ExistingData_ArchivedPlantInventory" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" Width="100%" Height="550px">
    </rsweb:ReportViewer>

</asp:Content>


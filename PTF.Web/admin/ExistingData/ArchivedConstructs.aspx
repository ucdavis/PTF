<%@ Page Title="PTF | Archived Constructs" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArchivedConstructs.aspx.cs" Inherits="admin_ExistingData_ArchivedConstructs" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" Width="100%" Height="550px">
    </rsweb:ReportViewer>
</asp:Content>


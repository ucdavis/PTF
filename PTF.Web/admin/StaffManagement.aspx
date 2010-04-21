<%@ Page Title="PTF | Staff Management" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StaffManagement.aspx.cs" Inherits="admin_StaffManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="width:100%; height: 500px" align="Center">
    <iframe id="frame" frameborder="0" src='<%= ConfigurationManager.AppSettings["AdminPageURL"] %>'
        scrolling="auto" name="frame" style="width:100%; height:100%;">
    </iframe>
</div>

</asp:Content>


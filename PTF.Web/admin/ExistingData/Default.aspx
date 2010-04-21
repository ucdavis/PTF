<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_ExistingData_Default" Title="PTF | Archived Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../../Images/back.png" alt="" /> [Back to Admin Home]</asp:LinkButton>
    </div>

    <ul class="menu">
    <li><a href="ArchivedConstructs.aspx"><img src="../../Images/menu_constructs.png" title="Constructs" /></a></li>
    <li><a href="ArchivedExperiments.aspx"><img src="../../Images/menu_experiments.png" title="Experiments" /></a></li>
    <li><a href="ArchivedPlantInventory.aspx"><img src="../../Images/menu_plantinventory.png" title="Plant Inventory" /></a></li>
    </ul>
    
</asp:Content>


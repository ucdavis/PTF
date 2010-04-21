<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_ExistingData_Default" Title="PTF | Archived Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../../Images/back.png" alt="" /> [Back to Admin Home]</asp:LinkButton>
    </div>

    <a href="Constructs.aspx">Constructs</a><br />
    <a href="Experiments.aspx">Experiments</a><br />
    <a href="PlantInventory.aspx">Plant Inventory</a>

</asp:Content>


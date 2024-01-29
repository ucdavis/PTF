<%@ Page Title="PTF | Add Sub Order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddSubOrder.aspx.cs" Inherits="admin_AddSubOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../Images/back.png" alt="" />[Back to Order]</asp:LinkButton>
    </div>
    
    <div id="NumberofPlantsContainer">
        <label>Number of Plants:</label>
        
        <asp:TextBox ID="tbNumberOfPlants" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNumPlants" runat="server" ErrorMessage="Required" ControlToValidate="tbNumberOfPlants" ValidationGroup="SaveSubOrder"></asp:RequiredFieldValidator>
    </div>
    
    <div id="cropContainer">
        <label>Crop:</label>
        
        <asp:DropDownList ID="ddlCrops" runat="server" DataSourceID="odsCrops" 
            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
            <asp:ListItem Value="-1" Text="--Select a Crop--"></asp:ListItem>            
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvCrops" runat="server" 
            ErrorMessage="Required" ControlToValidate="ddlCrops" 
            InitialValue="-1" ValidationGroup="SaveSubOrder"></asp:RequiredFieldValidator>
    </div>
    <div id="plantSelectionContainer">
        <label>Planet Selection:</label>
        
        <asp:DropDownList ID="ddlPlantSelection" runat="server" 
            DataSourceID="odsPlantSelection" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
            <asp:ListItem Value="-1" Text="--Select a Plant Selection--"></asp:ListItem>            
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvPlantSelection" runat="server" 
            ErrorMessage="Required" ControlToValidate="ddlPlantSelection" 
            InitialValue="-1" ValidationGroup="SaveSubOrder"></asp:RequiredFieldValidator>
    </div>
    <div id="genotypeContainer">
        <label>Genotype:</label>
        
        <asp:DropDownList ID="ddlGenotype" runat="server" DataSourceID="odsGenoType"  AppendDataBoundItems="true"
            DataTextField="Name" DataValueField="ID">
            <asp:ListItem Value="-1" Text="--Select a Genotype--"></asp:ListItem>            
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvGenotype" runat="server" 
            ErrorMessage="Required" ControlToValidate="ddlGenotype" 
            InitialValue="-1" ValidationGroup="SaveSubOrder"></asp:RequiredFieldValidator>
    </div>
    
    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" ValidationGroup="SaveSubOrder" />
    
    <asp:ObjectDataSource ID="odsCrops" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CropBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPlantSelection" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.PlantSelectionBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGenoType" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.GenoTypeBLL"></asp:ObjectDataSource>
</asp:Content>


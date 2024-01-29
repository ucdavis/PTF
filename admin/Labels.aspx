<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Labels.aspx.cs" Inherits="Labels" Title="PTF | Labels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../JS/Labels.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <a onclick="PrintLabels()" class="button"><img src="../Images/btn_print.png" alt="Print" /></a>

<asp:ListView ID="lvPlants" runat="server" DataSourceID="odsPlants">
    <LayoutTemplate>
        <div class="grid">
        <table cellspacing="0" cellpadding="15" id="PlantsTable">
            <tr class="head">
                <th></th>
                <th><asp:LinkButton ID="lbPedigree" CommandName="Sort" CommandArgument="PedigreeCode" runat="server">Pedigree</asp:LinkButton></th>
                <th>Crop</th>
                <th>Genotype</th>
                <th>PI Name</th>
                <th>PI Code</th>
            </tr>
            <tr runat="server" id="ItemPlaceHolder"></tr>
        </table>
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <tr id='<%# Eval("id") %>'>
            <td><span id="checkBox"><asp:CheckBox ID="cbSelected" runat="server" /></span></td>
            <td class="firstnum"><%# Eval("Pedigree")%></td>
            <td><%# Eval("Experiment.Construct.SubOrder.Crop.Name")%></td>
            <td><%# Eval("Experiment.Construct.Order.PICode") %></td>
            <td><%# Eval("Experiment.Construct.SubOrder.GenoType.Name") %></td>
            <td><%# Eval("Experiment.Construct.Order.PI") %></td>
        </tr>
    </ItemTemplate>
</asp:ListView>

<asp:ObjectDataSource ID="odsPlants" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSorted" 
        TypeName="CAESDO.PTF.BLL.PlantBLL" SortParameterName="propertyName">
    <SelectParameters>
        <asp:Parameter Name="propertyName" Type="String" />
    </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlantInventory.aspx.cs" Inherits="admin_ExistingData_PlantInventory" Title="PTF | Archived Plant Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../../JS/ExistingData.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvPlants" runat="server" DataSourceID="odsPlants">
        <LayoutTemplate>
            <table id="Plants" class="InfoTable">
                <tr>
                    <th scope="col">Transformation Code</th>
                    <th scope="col">Crop</th>
                    <th scope="col">Date Initiated</th>
                    <th scope="col">Date Entered</th>
                    <th scope="col">Genotype</th>
                    <th scope="col">PI</th>
                    <th scope="col">Client</th>
                    <th scope="col"># Plants Requested</th>
                    <th scope="col">Agro Strains</th>
                    <th scope="col">Construct Code</th>
                    <th scope="col">PI Construct Code</th>
                    <th scope="col">Gene Of Interest</th>
                    <th scope="col">Selection</th>
                    <th scope="col">Crop</th>
                    <th scope="col">Plasmid</th>
                    <th scope="col">Trait</th>
                    <th scope="col">Re-Callusing Assay</th>
                    <th scope="col">Rooting</th>
                    <th scope="col">Comment</th>
                    <th scope="col">DateDelivered</th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("id") %>'>               
                <td><%# Eval("id") %></td>
                <td><%# Eval("TransformationCode") %></td>
                <td><%# Eval("Crop") %></td>
                <td><%# Eval("DateInitiated", "{0:M/d/yy h:mm tt}") %></td>
                <td><%# Eval("DateEntered", "{0:M/d/yy h:mm tt}")%></td>
                <td><%# Eval("Genotype") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Client") %></td>
                <td><%# Eval("NumPlantsRequested") %></td>
                <td><%# Eval("AgroStrains") %></td>
                <td><%# Eval("ConstructCode") %></td>
                <td><%# Eval("PIConstructCode") %></td>
                <td><%# Eval("GeneOfInterest") %></td>
                <td><%# Eval("Selection") %></td>
                <td><%# Eval("Crop") %></td>
                <td><%# Eval("Plasmid") %></td>
                <td><%# Eval("Trait") %></td>
                <td><%# Eval("ReCallusingAssay") %></td>
                <td><%# Eval("Rooting") %></td>
                <td><%# Eval("Comment") %></td>
                <td><%# Eval("DateDelivered") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsPlants" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.ArchivedPlantInventoryBLL">
    </asp:ObjectDataSource>
    
    <script type="text/javascript">
        FreezeGridViewHeader('Plants','WrapperDiv');
    </script>
</asp:Content>


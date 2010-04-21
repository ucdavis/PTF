<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlantInventory.aspx.cs" Inherits="admin_ExistingData_PlantInventory" Title="PTF | Archived Plant Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../../JS/ExistingData.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvPlants" runat="server" DataSourceID="odsPlants">
        <LayoutTemplate>
            <table id="Plants">
                <tr>
                    <th scope="col"><asp:LinkButton ID="lbSortPedigree" CommandName="Sort" CommandArgument="Pedigree" runat="server">Pedigree</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortTransformation_Code" CommandName="Sort" CommandArgument="Transformation_Code" runat="server">Transformation_Code</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortCrop" CommandName="Sort" CommandArgument="Crop" runat="server">Crop</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortDate_Initiated" CommandName="Sort" CommandArgument="Date_Initiated" runat="server">Date Initiated</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortDate_entered" CommandName="Sort" CommandArgument="Date_entered" runat="server">Date Entered</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortGenotype" CommandName="Sort" CommandArgument="Genotype" runat="server">Genotype</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortPI" CommandName="Sort" CommandArgument="PI" runat="server">PI</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortClient" CommandName="Sort" CommandArgument="Client" runat="server">Client</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSort__Plants_Requested" CommandName="Sort" CommandArgument="__Plants_Requested" runat="server"># Plants Requested</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortAgro_Strains" CommandName="Sort" CommandArgument="Agro_Strains" runat="server">Agro Strains</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortConstruct_code" CommandName="Sort" CommandArgument="Construct_code" runat="server">Construct Code</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortPI_Construct_Code" CommandName="Sort" CommandArgument="PI_Construct_Code" runat="server">PI_Construct_Code</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortGene_of_Interest" CommandName="Sort" CommandArgument="Gene_of_Interest" runat="server">Gene_of_Interest</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortSelection" CommandName="Sort" CommandArgument="Selection" runat="server">Selection</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortPlasmid" CommandName="Sort" CommandArgument="Plasmid" runat="server">Plasmid</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortTrait" CommandName="Sort" CommandArgument="Trait" runat="server">Trait</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortRe_callusing_Assay" CommandName="Sort" CommandArgument="Re_callusing_Assay" runat="server">Re Callusing Assay</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortRooting" CommandName="Sort" CommandArgument="Rooting" runat="server">Rooting</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortComment" CommandName="Sort" CommandArgument="Comment" runat="server">Comment</asp:LinkButton></th>
                    <th scope="col"><asp:LinkButton ID="lbSortDate_delivered" CommandName="Sort" CommandArgument="Date_delivered" runat="server">Date Delivered</asp:LinkButton></th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("Pedigree") %>'>
                <td><%# Eval("Pedigree")%></td>
                <td><%# Eval("Transformation_Code")%></td>
                <td><%# Eval("Crop") %></td>
                <td><%# Eval("Date_Initiated") %></td>
                <td><%# Eval("Date_entered") %></td>
                <td><%# Eval("Genotype") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Client") %></td>
                <td><%# Eval("__Plants_Requested") %></td>
                <td><%# Eval("Agro_Strains") %></td>
                <td><%# Eval("Construct_code") %></td>
                <td><%# Eval("PI_Construct_Code") %></td>
                <td><%# Eval("Gene_of_Interest") %></td>
                <td><%# Eval("Selection") %></td>
                <td><%# Eval("Plasmid") %></td>
                <td><%# Eval("Trait") %></td>
                <td><%# Eval("Re_callusing_Assay") %></td>
                <td><%# Eval("Rooting") %></td>
                <td><%# Eval("Comment") %></td>
                <td><%# Eval("Date_delivered") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsPlants" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllPlants" 
        TypeName="CAESDO.PTF.BLL.ExistingBLL" SortParameterName="sortExp">
    </asp:ObjectDataSource>
</asp:Content>


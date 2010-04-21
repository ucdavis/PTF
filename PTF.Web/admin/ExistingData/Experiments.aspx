<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiments.aspx.cs" Inherits="admin_ExistingData_Experiments" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="../../JS/ExistingData.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvExperiments" runat="server" DataSourceID="odsExperiments">
        <LayoutTemplate>
            <table id="Experiments">
                <tr>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortExperiment" CommandName="Sort" CommandArgument="Experiment" runat="server">Experiment</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortDate" CommandName="Sort" CommandArgument="Date" runat="server">Date</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortPI" CommandName="Sort" CommandArgument="PI" runat="server">PI</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortClient" CommandName="Sort" CommandArgument="Client" runat="server">Client</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortOperator" CommandName="Sort" CommandArgument="Operator" runat="server">Operator</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortCropSpecies" CommandName="Sort" CommandArgument="Crop_species" runat="server">Crop Species</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortCultivar" CommandName="Sort" CommandArgument="Cultivar" runat="server">Cultivar</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortAgroStrain" CommandName="Sort" CommandArgument="Agro_Strain" runat="server">Agro Strain</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortAgroCode" CommandName="Sort" CommandArgument="Agro_Code" runat="server">Agro Code</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortPIConstructCode" CommandName="Sort" CommandArgument="PI_Construct_Code" runat="server">PI Construct Code</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortPlasmid" CommandName="Sort" CommandArgument="Plasmid" runat="server">Plasmid</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortAgroSelection" CommandName="Sort" CommandArgument="Agro_Selection" runat="server">Agro Selection</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortPlantSelection" CommandName="Sort" CommandArgument="Plant_Selection" runat="server">Plant Selection</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortExplant" CommandName="Sort" CommandArgument="Explant" runat="server">Explant</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortPrecondition" CommandName="Sort" CommandArgument="Precondition" runat="server">Precondition</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortCoCulture" CommandName="Sort" CommandArgument="Co_Culture" runat="server">Co_Culture</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortInduction" CommandName="Sort" CommandArgument="Induction" runat="server">Induction</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortInductionII" CommandName="Sort" CommandArgument="Induction_II" runat="server">Induction II</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortInductionIII" CommandName="Sort" CommandArgument="Induction_III" runat="server">Induction III</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortElongationGermination" CommandName="Sort" CommandArgument="Elongation_Germination" runat="server">Elongation Germination</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortRecallusing" CommandName="Sort" CommandArgument="Recallusing" runat="server">Recallusing</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortRooting" CommandName="Sort" CommandArgument="Rooting" runat="server">Rooting</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortTrait" CommandName="Sort" CommandArgument="Trait" runat="server">Trait</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortComment" CommandName="Sort" CommandArgument="Comment" runat="server">Comment</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortInvoiceSent" CommandName="Sort" CommandArgument="Invoice_Sent" runat="server">Invoice Sent</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortTargetedfPlants" CommandName="Sort" CommandArgument="Targeted___of_Plants" runat="server">Targeted # of Plants</asp:LinkButton>
                    </th>
                    <th scope="col">
                        <asp:LinkButton ID="lbSortOpticalDensity" CommandName="Sort" CommandArgument="Optical_Density" runat="server">Optical Density</asp:LinkButton>
                    </th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("Experiment") %>'>
                <td><%# Eval("Experiment")%></td>
                <td><%# Eval("Date")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("Operator")%></td>
                <td><%# Eval("Crop_species")%></td>
                <td><%# Eval("Cultivar") %></td>
                <td><%# Eval("Agro_Strain") %></td>
                <td><%# Eval("Agro_Code") %></td>
                <td><%# Eval("PI_Construct_Code") %></td>
                <td><%# Eval("Plasmid") %></td>
                <td><%# Eval("Agro_Selection") %></td>
                <td><%# Eval("Plant_Selection") %></td>
                <td><%# Eval("Explant") %></td>
                <td><%# Eval("Precondition") %></td>
                <td><%# Eval("Co_Culture") %></td>
                <td><%# Eval("Induction") %></td>
                <td><%# Eval("Induction_II") %></td>
                <td><%# Eval("Induction_III") %></td>
                <td><%# Eval("Elongation_Germination") %></td>
                <td><%# Eval("Recallusing") %></td>
                <td><%# Eval("Rooting") %></td>
                <td><%# Eval("Trait") %></td>
                <td><%# Eval("Comment") %></td>
                <td><%# Eval("Invoice_Sent") %></td>
                <td><%# Eval("Targeted___of_Plants") %></td>
                <td><%# Eval("Optical_Density") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsExperiments" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllExperiments" 
        TypeName="CAESDO.PTF.BLL.ExistingBLL" SortParameterName="sortExp">
    </asp:ObjectDataSource>

</asp:Content>


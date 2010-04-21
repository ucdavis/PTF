<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiments.aspx.cs" Inherits="admin_ExistingData_Experiments" Title="PTF | Archived Experiments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="../../JS/ExistingData.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvExperiments" runat="server" DataSourceID="odsExperiments">
        <LayoutTemplate>
            <table id="Experiments" class="InfoTable">
                <tr>
                    <th scope="col">
                        Experiment
                    </th>
                    <th scope="col">
                        Date
                    </th>
                    <th scope="col">
                        PI
                    </th>
                    <th scope="col">
                        Client
                    </th>
                    <th scope="col">
                        Operator
                    </th>
                    <th scope="col">
                        Crop Species
                    </th>
                    <th scope="col">
                        Cultivar
                    </th>
                    <th scope="col">Seed Lot Number</th>
                    <th scope="col">
                        Agro Strain
                    </th>
                    <th scope="col">
                        Agro Code
                    </th>
                    <th scope="col">
                        PI Construct Code
                    </th>
                    <th scope="col">
                        Plasmid
                    </th>
                    <th scope="col">
                        Agro Selection
                    </th>
                    <th scope="col">
                        Plant Selection
                    </th>
                    <th scope="col">
                        Explant
                    </th>
                    <th scope="col">
                        Precondition
                    </th>
                    <th scope="col">
                        Co_Culture
                    </th>
                    <th scope="col">
                        Induction
                    </th>
                    <th scope="col">
                        Induction II
                    </th>
                    <th scope="col">
                        Induction III
                    </th>
                    <th scope="col">
                        Elongation Germination
                    </th>
                    <th scope="col">
                        Recallusing
                    </th>
                    <th scope="col">
                        Rooting
                    </th>
                    <th scope="col">
                        Trait
                    </th>
                    <th scope="col">
                        Comment
                    </th>
                    <th scope="col">
                        Invoice Sent
                    </th>
                    <th scope="col">
                        Targeted # of Plants
                    </th>
                    <th scope="col">
                        Optical Density
                    </th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("id") %>'>
                <td><%# Eval("id")%></td>
                <td><%# Eval("Date", "{0:M/d/yy h:mm tt}")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("Operator")%></td>
                <td><%# Eval("CropSpecies")%></td>
                <td><%# Eval("Cultivar") %></td>
                <td><%# Eval("SeedLotNumber") %></td>
                <td><%# Eval("AgroStrain")%></td>
                <td><%# Eval("AgroCode")%></td>
                <td><%# Eval("PIConstructCode") %></td>
                <td><%# Eval("Plasmid") %></td>
                <td><%# Eval("AgroSelection")%></td>
                <td><%# Eval("PlantSelection")%></td>
                <td><%# Eval("Explant") %></td>
                <td><%# Eval("Precondition") %></td>
                <td><%# Eval("CoCulture")%></td>
                <td><%# Eval("Induction") %></td>
                <td><%# Eval("InductionII") %></td>
                <td><%# Eval("InductionIII") %></td>
                <td><%# Eval("ElongationGermination") %></td>
                <td><%# Eval("Recallusing") %></td>
                <td><%# Eval("Rooting") %></td>
                <td><%# Eval("Trait") %></td>
                <td><%# Eval("Comment") %></td>
                <td><%# Eval("InvoiceSent", "{0:M/d/yy h:mm tt}")%></td>
                <td><%# Eval("TargetedNumPlants") %></td>
                <td><%# Eval("OpticalDensity") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsExperiments" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.ArchivedExperimentBLL" >
    </asp:ObjectDataSource>

    <script type="text/javascript">
        FreezeGridViewHeader('Experiments','WrapperDiv');
    </script>

</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiments.aspx.cs" Inherits="admin_Experiments" Title="PTF | Experiments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvExperiments" runat="server" DataSourceID="odsExperiments">
        <LayoutTemplate>
            <table>
                <tr>
                    <th>Experiment Code</th>
                    <th>Operator</th>
                    <th>Seed Lot</th>
                    <th>Agro Selection</th>
                    <th>Explant</th>
                    <th>Trait</th>
                    <th>Optical Density</th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("ExperimentCode") %></td>
                <td><%# Eval("Operator.OperatorName") %></td>
                <td><%# Eval("SeedLotNumber") %></td>
                <td><%# Eval("AgroSelection") %></td>
                <td><%# Eval("Explant") %></td>
                <td><%# Eval("Trait") %></td>
                <td><%# Eval("OpticalDensity") %></td>
            </tr>
            <tr> 
                <td></td>
                <td colspan="6"><%# Eval("Comments") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsExperiments" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.ExperimentBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="DateStarted" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="false" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsExperimentsByConstruct" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByConstruct" 
        TypeName="CAESDO.PTF.BLL.ExperimentBLL">
        <SelectParameters>
            <asp:QueryStringParameter Name="constructID" QueryStringField="cid" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>


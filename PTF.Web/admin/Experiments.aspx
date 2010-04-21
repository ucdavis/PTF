<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiments.aspx.cs" Inherits="admin_Experiments" Title="PTF | Experiments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 705px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlConstructInfo" runat="server" Visible=false>
        <table class="style1">
            <tr>    
                <td class="InfoFieldName">Construct Code:&nbsp;</td>
                <td class="InfoFieldValue"><asp:Label ID="lblConstructCode" runat="server" Text=""></asp:Label></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="InfoFieldName">PI Construct Name:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="lblPIConstructName" runat="server" Text=""></asp:Label>
                </td>
                <td class="InfoFieldName">Archived Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="lblArchivedBox" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>    
                <td class="InfoFieldName">PI Code:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="InfoFieldName">Position:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Bacterial Selection:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="InfoFieldName">Working Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Plasmid:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="InfoFieldName">Location:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Trait:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="InfoFieldName">Gene of Interest:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
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
        <ItemSeparatorTemplate>
            <tr style="height:1px; background-color:Black;">
                <td colspan="7"></td>
            </tr>
        </ItemSeparatorTemplate>
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


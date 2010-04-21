<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders">
        <LayoutTemplate>
            <table>
                <tr>
                    <th></th>
                    <th>Order ID</th>
                    <th>PI</th>
                    <th>Contact Name</th>
                    <th>Contact E-mail</th>
                    <th>Date Requested</th>
                    <th># Constructs</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbSelect" runat="server">Select</asp:LinkButton>
                </td>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Image ID="imgDropDown" runat="server" ImageUrl="~/Images/dropdowntrigger.png" />
                    <AjaxControlToolkit:DropDownExtender ID="ddeDropDown" runat="server" TargetControlID="imgDropDown" DropDownControlID="pnlDropDown">
                    </AjaxControlToolkit:DropDownExtender>
                    <asp:Panel ID="pnlDropDown" runat="server" style="background:gray">
                        <asp:LinkButton ID="lbCreateConstruct" runat="server">Create Construct</asp:LinkButton>
                    </asp:Panel>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.OrderBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="DateRequested" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:Button ID="btnDummy" runat="server" Text="Button" />
    
    <AjaxControlToolkit:ModalPopupExtender ID="NewConstruct_ModalPopupExtender" 
        runat="server" DynamicServicePath="" Enabled="True" TargetControlID="btnDummy">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:Panel ID="pnlCreateConstruct" runat="server" BorderColor=Black BorderStyle="Solid" BorderWidth="1px" Width="400px">
        Plants Requested: <asp:TextBox ID="tbPlantsRequested" runat="server"></asp:TextBox>
        <br />
        PI Construct Name: <asp:TextBox ID="tbPIConstructName" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        PI Code: <asp:TextBox ID="tbPICode" runat="server"></asp:TextBox>
        <br />
        Bacterial Selection: <asp:TextBox ID="tbBacterialSelection" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Plasmid: <asp:TextBox ID="tbPlasmid" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Trait: <asp:TextBox ID="tbTrait" runat="server"></asp:TextBox>
        <br />
        Gene of Interest: <asp:TextBox ID="tbGeneofInterest" runat="server"></asp:TextBox>
        <br />
        Selectable Marker: <asp:DropDownList ID="ddlSelectableMarker" runat="server" 
            DataSourceID="odsSelectableMarker" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
        <br />
        Comment: <asp:TextBox ID="tbComment" runat="server" TextMode="MultiLine"></asp:TextBox>
    </asp:Panel>
    <asp:ObjectDataSource ID="odsSelectableMarker" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.SelectableMarkerBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>


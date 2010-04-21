<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="restricted_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <a href="PlaceOrder.aspx">Place New Order</a>
    <br /><br />

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders" 
        DataKeyNames="ID" onselectedindexchanged="lvOrders_SelectedIndexChanged">
        <LayoutTemplate>
            <table>
                <tr>
                    <td></td> <!-- Select Button Column !-->
                    <th>Order ID</th>
                    <th>Crop</th>
                    <th>Number of Plants</th>
                    <th>PI Name</th>
                    <th>DateRequested</th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:LinkButton ID="lbSelect" CommandName="Select" runat="server">Select</asp:LinkButton></td>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("Crop.Name") %></td>
                <td><%# Eval("NumberOfPlants") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("DateRequested") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" onselecting="odsOrders_Selecting" 
        SelectMethod="GetByUser" TypeName="CAESDO.PTF.BLL.OrderBLL">
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="currentUser" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>


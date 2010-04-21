<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr>
                    <th></th>
                    <th>Order ID</th>
                    <th>PI</th>
                    <th>Contact Name</th>
                    <th>Contact E-mail</th>
                    <th>Date Requested</th>
                    <th># Constructs</th>
                    <th>Status</th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <a href='<%# "Construct.aspx?oid=" + Eval("ID")%>'>Details</a>
                </td>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("Constructs.Count") %></td>
                <td><%# Eval("Status") %></td>
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
    

</asp:Content>


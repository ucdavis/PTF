<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../JS/CollapsibleTable.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders">
        <LayoutTemplate>
            <div class="grid">
                <table id="orders" cellpadding="20" cellspacing="0">
                    <tr class="head">
                        <th class="first"></th>
                        <th>Order ID</th>
                        <th>PI</th>
                        <th>Contact Name</th>
                        <th>Contact E-mail</th>
                        <th>Construct Name</th>
                        <th>PI Code</th>
                        <th>Date Requested</th>
                        <th># Constructs</th>
                        <th>Status</th>
                    </tr>
                    <tr id="ItemPlaceHolder" runat="server"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id="row" runat="server" class="group">
                <td class="first">
                    <img src="../images/plus.png" onclick="toggleGroup(this, '<%# Eval("SubOrders.Count") %>');" />
                </td>
                <td><a href='<%# "Order.aspx?oid=" + Eval("ID") %>'><%# Eval("ID") %></a></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("PIConstructName") %></td>
                <td><%# Eval("PICode") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("Constructs.Count") %></td>
                <td></td>
            </tr>
                <asp:ListView ID="lvSubOrders" runat="server" DataSource='<%# Eval("SubOrders") %>'>
                    <LayoutTemplate>
                        <tr runat="server" id="itemplaceholder"></tr>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server" class="item hidden">
                            <td class="first">
                            </td>
                            <td colspan="2"><%# "# Plants: " + Eval("NumberOfPlants") %></td>
                            <td colspan="2"><%# "Crop: " + Eval("Crop.Name") %></td>
                            <td colspan="2"><%# "Plant Selection: " + Eval("PlantSelection.Name") %></td>
                            <td colspan="2"><%# "Genotype: " + Eval("Genotype.Name") %></td>
                            <td>
                                <%# "# Constructs: " + Eval("Constructs.Count") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
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


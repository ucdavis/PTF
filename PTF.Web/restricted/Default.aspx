<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="restricted_Default" Title="PTF | Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="../JS/CollapsibleTable.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <span class="left" style="width: 155px;"><a href="PlaceOrder.aspx"><img src="../Images/btn_placeneworder.png" title="Place New Order" alt="Place New Order" /></a>
    </span>
    <span class="right" style="width: 134px;"><a href="Account.aspx"><img src="../Images/btn_clientprofile.png" title="Client Profile" alt="Profile" /></a>
    </span><br /><br />

    <p style="color:Red;">
        <asp:Literal ID="litDisabledAccount" runat="server" >
            Because the Facility is no longer accepting orders from outside the University of California System we cannot accept any more orders from this account.  Please note that all your existing orders will be completed.  If you are within the University of California System, please contact the staff so that we can arrange to have this account modified so that you can continue to place orders.  Before contacting the staff you will need to have your University of California campus email address ready.
        </asp:Literal>
    </p>

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders" DataKeyNames="ID" onselectedindexchanged="lvOrders_SelectedIndexChanged">
        <LayoutTemplate>
            <div class="grid">
            <table id="orders" cellpadding="10" cellspacing="0">
                <tr class="head">
                    <th class="first"></th>
                    <th># of Plants</th>
                    <th>Crop</th>
                    <th>Plant Selection</th>
                    <th>Genotype</th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="group">
                <td class="first">
                    <img src="../images/minus.png" onclick="toggleGroup(this, '<%# Eval("SubOrders.Count") %>', 'orders');" /> 
                </td>
                <td colspan="4">
                    <div style="float:left;">
                        <a href='<%# "Order.aspx?oid=" + Eval("ID").ToString() %>'>Order ID: <%# Eval("ID") %></a>
                    </div>
                    <div style="float:right;">
                        <%# Eval("DateRequested", "{0:d}") %>
                    </div>
                </td>
            </tr>
            <asp:ListView ID="lvSubOrders" runat="server" DataSource='<%# Eval("SubOrders") %>'>
                <LayoutTemplate>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr id="row" runat="server" class="item">
                        <td class="first"></td>
                        <td><%# Eval("NumberOfPlants") %></td>
                        <td><%# Eval("Crop.Name") %></td>
                        <td><%# Eval("PlantSelection.Name") %></td>
                        <td><%# Eval("GenoType.Name") %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" onselecting="odsOrders_Selecting" 
        SelectMethod="GetByUser" TypeName="CAESDO.PTF.BLL.OrderBLL">
        <SelectParameters>
            <asp:Parameter Name="currentUser" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="restricted_Order" Title="PTF | Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../JS/Order.js"></script>
    <script type="text/javascript" src="../JS/CollapsibleTable.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../Images/back.png" alt="" /> [Back to Orders]</asp:LinkButton>
    </div>

<table class="InfoTable clientOrder">
    <tr>
        <td class="InfoFieldName">Order ID:&nbsp;</td>
        <td class="InfoFieldValue">
            <asp:Literal ID="litOrderID" runat="server"></asp:Literal>
        </td>
        <td class="InfoFieldName">
            <asp:Literal ID="litShippingPermitPrompt" runat="server" Visible="false">Shipping Permit:&nbsp;</asp:Literal></td>
        <td class="InfoFieldValue">
            <asp:Panel runat='server' ID="pnlShippingPermit" Visible="false">
                <asp:TextBox ID="tbShippingPermit" runat="server" MaxLength="11" Width="80px"></asp:TextBox>           
                <a id="ShippingPermitButton" onclick='if (Page_ClientValidate("ShippingPermit")) { SaveProperty("<%= Request.QueryString["oid"] %>", "ShippingPermit", "<%= tbShippingPermit.ClientID %>", "Order");}'><img src="../Images/save.png" width="15px" alt="save" />
                <span id="ShippingPermit"></span>
                <asp:RequiredFieldValidator ID="rfvShippingPermit" runat="server" ErrorMessage="*" ControlToValidate="tbShippingPermit" ValidationGroup="ShippingPermit"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revShippingPermit" runat="server" ErrorMessage="Correct format: xx-xxx-xxxn/m" ControlToValidate="tbShippingPermit" ValidationExpression="^\d{2}-\d{3}-\d{3}[nm]$" ValidationGroup="ShippingPermit"></asp:RegularExpressionValidator>           
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="InfoFieldName">Construct:</td>
        <td class="InfoFieldValue">
            <asp:Literal ID="litNameOfConstruct" runat="server"></asp:Literal>
        </td>
        <td class="InfoFieldName">
            &nbsp;</td>
        <td class="InfoFieldValue">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="InfoFieldName">Status:&nbsp;</td>
        <td class="InfoFieldValue">
            <asp:Literal ID="litStatus" runat="server"></asp:Literal></td>
        <td class="InfoFieldName"></td>
        <td class="InfoFieldValue"></td>
    </tr>
    <tr>
        <td class="InfoFieldName">Comments:&nbsp;</td>
        <td class="InfoFieldValue">
            <asp:Literal ID="litComments" runat="server"></asp:Literal></td>
        <td class="InfoFieldName"></td>
        <td class="InfoFieldValue"></td>
    </tr>    
</table>

    <asp:ListView ID="lvSuborders" runat="server">
        <LayoutTemplate>
            <div class="grid">
            <table id="orders" cellpadding="10" cellspacing="0">
                <tr class="head">
                    <th class="first"></th>
                    <th>Pedigree</th>
                    <th>Date Initiated</th>
                    <th>Re-Callusing Assay</th>
                    <th>Rooting</th>
                    <th>Date Delivered</th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="group">
                <td class="first">
                    <img src="../images/minus.png" onclick="toggleGroup(this, '<%# Eval("Plants.Count") %>', 'orders');" /> 
                </td>
                <td colspan="2" class="labels">Crop:&nbsp;<%# Eval("Crop.Name") %></td>
                <td colspan="2">Plant Selection:&nbsp;<%# Eval("PlantSelection.Name") %></td>
                <td>GenoType:&nbsp;<%# Eval("GenoType.Name") %></td>
            </tr>
            <asp:ListView ID="lvPlants" runat="server" DataSource='<%# Eval("Plants") %>'>
                <LayoutTemplate>
                    <tr runat="server" id="ItemPlaceHolder"></tr>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr id="row" class="item">
                        <td class="first"></td>
                        <td class="labels"><%# Eval("Pedigree") %></td>
                        <td><%# Eval("DateEntered", "{0:MM/dd/yyyy}")%></td>
                        <td><%# Eval("ReCallusingAssay") %></td>
                        <td><%# Eval("Rooting") %></td>
                        <td><%# Eval("DateDelivered", "{0:MM/dd/yyyy}")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:ListView>
    
</asp:Content>


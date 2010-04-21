<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="restricted_Order" Title="PTF | Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../JS/CollapsibleTable.js"></script>

<script type="text/javascript">
    function SaveShippingPermit()
    {
        var shippingPermit = $get('<%= tbShippingPermit.ClientID %>').value;
    
        PageMethods.SaveShippingPermit('<%= Request.QueryString["oid"] %>', shippingPermit, SaveShippingPermitOnComplete, null, shippingPermit);
    }
    
    function SaveShippingPermitOnComplete(result, context)
    {
        $get("ShippingPermit").innerHTML = context;
        
        $get('<%= tbShippingPermit.ClientID %>').style.display = "none";
        $get('<%= lbSaveShippingPermit.ClientID %>').style.display = "none";
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="InfoTable">
    <tr>
        <td class="InfoFieldName">Order ID:&nbsp;</td>
        <td class="InfoFieldValue">
            <asp:Literal ID="litOrderID" runat="server"></asp:Literal>
        </td>
        <td class="InfoFieldName">
            <asp:Literal ID="litShippingPermitPrompt" runat="server" Visible="false">Shipping Permit:&nbsp;</asp:Literal></td>
        <td class="InfoFieldValue">
            <div id="ShippingPermit">
                <asp:Literal ID="litShippingPermit" runat="server" Visible="false"></asp:Literal>
            </div>
            <asp:TextBox ID="tbShippingPermit" runat="server" Visible="false"></asp:TextBox>
            <asp:LinkButton ID="lbSaveShippingPermit" runat="server" OnClientClick="SaveShippingPermit(); return false;" Visible="false">[Save]</asp:LinkButton>
        </td>
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
                <tr class="Head">
                    <td class="first"></td>
                    <td>Pedigree</td>
                    <td>Date Initiated</td>
                    <td>Re-Callusing Assay</td>
                    <td>Rooting</td>
                    <td>Date Delivered</td>
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
                <td colspan="2">Crop:&nbsp;<%# Eval("Crop.Name") %></td>
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
                        <td><%# Eval("Pedigree") %></td>
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


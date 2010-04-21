<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="admin_Billing" Title="PTF | Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function ConfirmBilling(link)
        {
            return confirm("Are you sure you would like to bill this construct (" + link.parentNode.id + ")?");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs" DataKeyNames="id"
        onselectedindexchanged="lvConstructs_SelectedIndexChanged">
        <LayoutTemplate>
            <div class="grid">
            <table cellpadding="15" cellspacing="0">
                <tr class="head">
                    <th></th>
                    <th>Construct Code</th>
                    <th>PI</th>
                    <th>Recharge Number</th>
                    <th>Contract Number</th>
                    <th>Billing Amount</th>
                </tr>
                <tr runat="server" id="ItemPlaceHolder"></tr>
            </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <div id='<%# Eval("ConstructCode") %>'>
                        <asp:LinkButton ID="lbBilled" CommandName="Select" OnClientClick='return ConfirmBilling(this);' runat="server">Bill</asp:LinkButton>
                    </div>
                </td>
                <td><%# Eval("ConstructCode") %></td>
                <td><%# Eval("Order.PI") %></td>
                <td><%# Eval("Order.RechargeNumber") == null ? Resources.CommonStrings.STR_NotAvailable : Eval("Order.RechargeNumber") %></td>
                <td><%# Eval("Order.ContractNumber") == null ? Resources.CommonStrings.STR_NotAvailable : Eval("Order.ContractNumber")%></td>
                <td><%# Eval("RechargeAmount") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:ObjectDataSource ID="odsConstructs" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetForBilling" 
        TypeName="CAESDO.PTF.BLL.ConstructBLL"></asp:ObjectDataSource>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="admin_Billing" Title="PTF | Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function ConfirmBilling(link) {
            var modal = $find('<%= mpeBill.BehaviorID %>');
            $get('<%= hfConstruct.ClientID %>').value = link.parentNode.id;
            modal.show();
            //return confirm("Are you sure you would like to bill this construct (" + link.parentNode.id + ")?");
            
            return false;
        }

        function SavingBilling() {
            var construct = $get('<%= hfConstruct.ClientID %>').value;
            var dafisDoc = $get('<%= tbDafisDoc.ClientID %>').value;

            // push the save
            ScriptServices.Bill(construct, dafisDoc, OnComplete, OnFail, construct);
        }

        // successful complete of save
        function OnComplete(result, context) {

            $find('<%= mpeBill.BehaviorID %>').hide();
            var div = $get(context);

            var children = div.childNodes;
            var obj;
            for (var i = 0; i < children.length; i++) {

                var id = children[i].id; //.IndexOf("lbBilled");
                if ((id != undefined) && (id.indexOf("lbBilled") != -1)) {
                    obj = children[i];
                    break;
                }
            }
            div.removeChild(obj);
        }
        // failure of save
        function OnFail(result, context) {
            if (result != "") {
                alert(result._message);
            }
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
                    <th>Dafis Doc</th>
                    <th>Billing Amount</th>
                    <th>Invoice Date</th>
                </tr>
                <tr runat="server" id="ItemPlaceHolder"></tr>
            </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <div id='<%# Eval("ID") %>'>
                        <asp:LinkButton ID="lbBilled" CommandName="Select" OnClientClick='return ConfirmBilling(this);' runat="server"><img src="../Images/btn_bill.png" alt="Bill" style='display:<%# Eval("InvoiceDate") == null ? "inline-block" : "none" %>;' /></asp:LinkButton>
                        <asp:LinkButton ID="lbInvoice" OnCommand="lbInvoice_OnCommand" CommandArgument='<%# Eval("ID") %>' runat="server"><img src="../Images/btn_invoice.png" alt="Invoice" /></asp:LinkButton>
                    </div>
                </td>
                <td class="firstnum"><%# Eval("ConstructCode") %></td>
                <td><%# Eval("Order.PI") %></td>
                <td><%# Eval("Order.RechargeNumber") == null ? Resources.CommonStrings.STR_NotAvailable : Eval("Order.RechargeNumber") %></td>
                <td><%# Eval("DafisDoc") == null ? Resources.CommonStrings.STR_NotAvailable : Eval("DafisDoc")%></td>
                <td><%# Eval("RechargeAmount") %></td>
                <td><%# Eval("InvoiceDate") != null ? ((DateTime?)Eval("InvoiceDate")).Value.ToString("d") : string.Empty %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:ObjectDataSource ID="odsConstructs" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetForBilling" 
        TypeName="CAESDO.PTF.BLL.ConstructBLL"></asp:ObjectDataSource>
           <asp:Button runat="server" ID="btnDummyPlantNote" Text="DUmmy" style="display:none;" />

    <AjaxControlToolkit:ModalPopupExtender ID="mpeBill" BehaviorID="mpeBill" BackgroundCssClass="popup_shadow" runat="server" TargetControlID="btnDummyPlantNote" PopupControlID="pnlBill" CancelControlID="lbCancelPlantNote">
    </AjaxControlToolkit:ModalPopupExtender> 
    <asp:Panel ID="pnlBill" runat="server">
        <div class="popup">
            <div class="close">
                <asp:ImageButton ID="lbCancelPlantNote" ToolTip="Close" ImageUrl="~/Images/btn_close.png" runat="server" Text="X" />
            </div>
            
            <h2>Dafic Doc Number</h2> <asp:TextBox ID="tbDafisDoc" runat="server"></asp:TextBox>
            <asp:HiddenField ID="hfConstruct" runat="server" />
            <a id="SavePlantComments" onclick="SavingBilling()"><img src="../Images/save.png" width="20px" alt="save" /></a>
        </div>
        <p class="popup_bottom">&nbsp;</p>
    </asp:Panel>
</asp:Content>


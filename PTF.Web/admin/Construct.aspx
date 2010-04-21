﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Construct.aspx.cs" Inherits="admin_Construct" Title="PTF | Construct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" language="javascript">
    function ChangeRechargeAmount()
    {      
        var constructID = '<%= Request.QueryString["cid"] %>';
        var rechargeAmount = $get('<%= tbChangeRechargeAmount.ClientID %>').value;
            
        PageMethods.ChangeRecharge(constructID, rechargeAmount, ChangeRechargeAmountOnComplete);
    }
    
    function ChangeRechargeAmountOnComplete(result)
    {
        var rechargeSpan = $get("RechargeAmount");
        rechargeSpan.innerHTML = result;
                
        $get('<%= tbChangeRechargeAmount.ClientID %>').value = "";
    }
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="InfoTable">
        <tr>
            <td class="InfoFieldName">Construct Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litConstructCode" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Plant Selection:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPlantSelection" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Date Created:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litDateCreated" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Bacterial Selection:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litBacterialSelection" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
            <td class="InfoFieldName">Agro Strain:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litAgroStrain" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Crop:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litCrop" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Plasmid:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPlasmid" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Genotype:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litGenotype" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">PI Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPICode" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Invoice Date:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litInvoiceDate" runat="server"></asp:Literal></td>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
        </tr>     
        <tr>
            <td class="InfoFieldName">Recharge Amount:&nbsp;</td>
            <td class="InfoFieldValue">
                <span id="RechargeAmount">
                    <asp:Literal ID="litRecharge" runat="server"></asp:Literal>
                </span>    
                <asp:LinkButton ID="lbChangeRechargeAmount" runat="server">[Change]</asp:LinkButton>
            </td>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
        </tr>  
        <tr>
            <td colspan="4">
                <strong>Comments:</strong>
                <br />
                <asp:Literal ID="litComments" runat="server"></asp:Literal>
            </td>
        </tr>                          
    </table>
    <br />
    <asp:Button ID="btnNewExperiment" runat="server" Text="Create Experiment" /><br />
    <asp:ListView ID="lvExperiments" runat="server">
        <LayoutTemplate>
            <div class="grid">
                <table cellpadding="10" cellspacing="0">
                    <tr class="head">
                        <th class="first"></th>
                        <th>Experiment Code</th>
                        <th>Operator</th>
                        <th>Explant</th>
                        <th>Optical Density</th>
                        <th>Comments</th>
                    </tr>
                    <tr runat='server' id="itemplaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>  
            <tr id="row" runat='server' class="group">
                <td class="first"></td>
                <td><a href='<%# "Experiment.aspx?eid=" + Eval("id") %>'><%# Eval("ExperimentCode") %></a></td>
                <td><%# Eval("Operator.OperatorName") %></td>
                <td><%# Eval("Explant") %></td>
                <td><%# Eval("OpticalDensity")%></td>
                <td></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No experiments exist for this construct.
        </EmptyDataTemplate>
    </asp:ListView>
    
    <asp:Panel ID="pnlNewExperiment" runat="server" Width="300px" BackColor="OldLace">
        <div style="float:right;">
            <asp:Button ID="btnCancelNewExperiment" runat="server" Text="X" />
        </div>
        <br /><br />
        <table> 
            <tr>
                <td>Operator:&nbsp;</td>
                <td>
                    <asp:DropDownList ID="ddlOperators" runat="server" DataSourceID="odsOperators" 
                        DataTextField="OperatorName" DataValueField="ID" AppendDataBoundItems="true">
                            <asp:ListItem Text="--Select an Operator--" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvOperators" runat="server" ErrorMessage="*" ControlToValidate="ddlOperators" InitialValue="-1" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Seed Lot Number:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbSeedLotNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSeedLotNumber" runat="server" ErrorMessage="*" ControlToValidate="tbSeedLotNumber" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Explant:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbExplant" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvExplant" runat="server" ErrorMessage="*" ControlToValidate="tbExplant" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Optical Density:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbOpticalDensity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvOpticalDensity" runat="server" ErrorMessage="*" ControlToValidate="tbOpticalDensity" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revOpticalDensity" runat="server" ErrorMessage="*" ControlToValidate="tbOpticalDensity" ValidationGroup="NewExperiment" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnCreate" runat="server" Text="Create" 
            onclick="btnCreate_Click" ValidationGroup="NewExperiment" />
    </asp:Panel>
    <AjaxControlToolkit:ModalPopupExtender ID="mpeNewExperiment" runat="server" TargetControlID="btnNewExperiment" PopupControlID="pnlNewExperiment" CancelControlID="btnCancelNewExperiment">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:Panel ID="pnlChangeRechargeAmount" runat="server" Width="250px" style="border:solid 1px black; background-color:oldlace;">
        <div style="float:right;">
            <asp:Button ID="btnCancelChangeRechargeAmount" runat="server" Text="X" />
        </div>
        
        <br />
        Recharge Amount:&nbsp;$<asp:TextBox ID="tbChangeRechargeAmount" runat="server" Width="50px"></asp:TextBox><br />
        <asp:Button ID="btnSaveChangeRechargeAmount" runat="server" Text="Save" />
    </asp:Panel>
    <AjaxControlToolkit:ModalPopupExtender ID="mpeChangeRechargeAmount" runat="server" 
        TargetControlID="lbChangeRechargeAmount" PopupControlID="pnlChangeRechargeAmount" 
        CancelControlID="btnCancelChangeRechargeAmount" OkControlID="btnSaveChangeRechargeAmount" OnOkScript="ChangeRechargeAmount()">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:ObjectDataSource ID="odsOperators" runat="server" 
         OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectable" 
         TypeName="CAESDO.PTF.BLL.OperatorBLL"></asp:ObjectDataSource>
</asp:Content>


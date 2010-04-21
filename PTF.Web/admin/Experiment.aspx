﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiment.aspx.cs" Inherits="admin_Experiment" Title="PTF | Experiment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">    
        var STR_LoadingImg = "LoadingImg";
        var STR_ConfirmImg = "ConfirmImg";
        var STR_FailImg = "FailImg";
    
        var STR_Inline = "inline";
        var STR_None = "none";
    
        function ChangeStatus(dropDown)
        {       
            var plantID = dropDown.parentNode.id;
            var selectedIndex = dropDown.selectedIndex;
            var value = dropDown.options[selectedIndex].value;
            
            if (dropDown.options[selectedIndex].text == "Shipped" && !confirm("Are you sure plant is shipping?"))
            {
                return;
            }
            
            var context = new Array();           
            context[0] = plantID;
            context[1] = dropDown;
            
            // show the processing icon
            $get(plantID + STR_LoadingImg).style.display = STR_Inline;
            $get(plantID + STR_ConfirmImg).style.display = STR_None;
            $get(plantID + STR_FailImg).style.display = STR_None;
            
            PageMethods.SaveChangeStatus(plantID, value, ChangeStatusOnComplete, ChangeStatusOnFail, context);
        }
        // successful complete of save
        function ChangeStatusOnComplete(result, context)
        {        
            if (result != "")
            {
                context[1].disabled = true;
            }
            
            $get(context[0] + "DateDelivered").innerHTML = result;
            
            $get(context[0] + STR_LoadingImg).style.display = STR_None;
            $get(context[0] + STR_ConfirmImg).style.display = STR_Inline;
            
            // animate the check mark confirmation out
            var target = $get(context[0] + STR_ConfirmImg);
            var animation = new AjaxControlToolkit.Animation.FadeOutAnimation(target, 5, 25, 0, 1, true);
            animation.play();
        }
        // failure of save
        function ChangeStatusOnFail(result, context)
        {
            $get(context[0] + STR_FailImg).style.display = STR_Inline;
            $get(context[0] + STR_LoadingImg).style.display = STR_None;
        }
    </script>

    <span class="contractwarning">
        <asp:Literal ID="litContractNotExecuted" runat="server"></asp:Literal>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td class="InfoFieldName">Experiment Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litExperimentCode" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Date Started:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litDateStarted" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Operator:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litOperator" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">Seed Lot #:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litSeedLotNum" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">Target # Plants:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litTargetNumPlants" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Trait:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litTrait" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">Genotype:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litGenotype" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">PI Name:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPIName" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="InfoFieldName">Explant:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litExplant" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">Optical Density:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litOpticalDensity" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName">Contact E-Mail:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litContactEmail" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="InfoFieldName">Crop:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litCrop" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
            <td class="InfoFieldName">PI Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPICode" runat="server"></asp:Literal>
            </td>
        </tr>       
    </table>
    
    <asp:Button ID="btnMakeNote" runat="server" Text="Make Note" />
    
    <asp:ListView ID="lvInduction" runat="server">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr><th colspan="2">Induction Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("DateNote", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No induction notes.
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:ListView ID="lvElongationGermination" runat="server">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr><th colspan="2">Elongation/Germination Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No Elongation/Germination notes.
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:ListView ID="lvRecallusing" runat="server">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr><th colspan="2">Recallusing Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No Recallusing notes.
        </EmptyDataTemplate>    
    </asp:ListView>
    <asp:ListView ID="lvRooting" runat="server">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr><th colspan="2">Rooting Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText") %></td>
            </tr>
        </ItemTemplate>  
        <EmptyDataTemplate>
            No Rooting notes.
        </EmptyDataTemplate>  
    </asp:ListView>
    
    <AjaxControlToolkit:ModalPopupExtender ID="mpeMakeNote" runat="server" TargetControlID="btnMakeNote" PopupControlID="pnlMakeNote" CancelControlID="btnCancelMakeNote">
    </AjaxControlToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlMakeNote" runat="server" Width="500px" style="border:solid 1px black; background-color:oldlace;">
        <div style="float:right;">
            <asp:Button ID="btnCancelMakeNote" runat="server" Text="X" />
        </div>
        
        <table>
            <tr>
                <td style="text-align:right; width:125px;">Note Type:&nbsp;</td>
                <td>
                    <asp:DropDownList ID="ddlNoteType" runat="server" DataSourceID="odsNoteTypes" 
                        DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                        <asp:ListItem Text="--Select Note Type--" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:right; width:125px;">Note:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbNote" runat="server" Height="146px" TextMode="MultiLine" 
                        Width="387px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnCreate" runat="server" Text="Create" 
                        onclick="btnCreate_Click" /></td>
            </tr>
        </table>
    </asp:Panel>
    
    <asp:Button ID="btnAddPlant" runat="server" Text="Add Plant" 
        onclick="btnAddPlant_Click" />
    
    <asp:ListView ID="lvPlants" runat="server" 
        onitemdatabound="lvPlants_ItemDataBound">
        <LayoutTemplate>
            <table>
                <tr>
                    <th>Pedigree</th>
                    <th>Date Entered</th>
                    <th>Re-Callusing Assay</th>
                    <th>Rooting</th>
                    <th>Date Delivered</th>
                    <th>Status</th>
                    <th>Comments</th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Pedigree") %></td>
                <td><%# Eval("DateEntered", "{0:MM/dd/yyyy}")%></td>
                <td><%--<%# Eval("ReCallusingAssay") %>--%>
                    <asp:CheckBox ID="cbRecallusingAssay" runat="server" Checked='<%# Eval("ReCallusingAssay") %>' />
                </td>
                <td><%--<%# Eval("Rooting") %>--%>
                    <asp:CheckBox ID="cbRooting" runat="server" Checked='<%# Eval("Rooting") %>' />
                </td>
                <td>
                    <span id='<%# Eval("id").ToString() + "DateDelivered" %>'>
                        <%# Eval("DateDelivered", "{0:MM/dd/yyyy}") %>
                    </span>
                </td>
                <td>
                    <span id='<%# Eval("id") %>'>
                        <asp:DropDownList ID="ddlChangeStatus" runat="server" 
                            DataSourceID="odsStatus" DataTextField="Name" 
                            DataValueField="ID" onChange='ChangeStatus(this)' >
                        </asp:DropDownList>
                        
                        <img id='<%# Eval("id").ToString() + "LoadingImg" %>' src="../Images/mozilla_blu.gif" style="display:none;" />
                        <img id='<%# Eval("id").ToString() + "ConfirmImg" %>'src="../Images/confirm.png" style="display:none; width:16px; height:16px;" />
                        <img id='<%# Eval("id").ToString() + "FailImg" %>' src="../Images/cancel.png" style="display:none; width:16px; height:16px;" />
                        
                        <asp:Literal ID="litStatus" runat="server" Visible="false"></asp:Literal>

                    </span>
                </td>
                <td></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:ObjectDataSource ID="odsNoteTypes" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.NoteTypeBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsStatus" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.StatusBLL"></asp:ObjectDataSource>    
</asp:Content>


﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiment.aspx.cs" Inherits="admin_Experiment" Title="PTF | Experiment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    
    <asp:ListView ID="lvPlants" runat="server">
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
                <td><%# Eval("ReCallusingAssay") %></td>
                <td><%# Eval("Rooting") %></td>
                <td><%# Eval("DateDelivered") %></td>
                <td><%# Eval("Status.Name") %></td>
                <td></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsNoteTypes" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.NoteTypeBLL"></asp:ObjectDataSource>
</asp:Content>


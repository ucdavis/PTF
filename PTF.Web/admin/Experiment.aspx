<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiment.aspx.cs" Inherits="admin_Experiment" Title="PTF | Experiment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../JS/Experiment.js" ></script>
    <script type="text/javascript" src="../JS/Order.js"></script>
    
    <script type="text/javascript">
    function SavePlantComments(plantIDBox, property, txtBox, objType)
    {
        SaveProperty($get(plantIDBox).value, property, txtBox, objType);
    }
    

    </script>
    
    <span class="ContractWarning">
        <asp:Literal ID="litContractNotExecuted" runat="server"></asp:Literal>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../Images/back.png" alt="" /> [Back to Construct]</asp:LinkButton>
    </div>

    <table class="InfoTable">
        <tr class="head">
            <td colspan="6">Experiment Information</td>
        </tr>
        <tr>
            <td class="InfoFieldName c3 col1">Experiment Code:&nbsp;</td>
            <td class="InfoFieldValue c3 col2">
                <asp:Literal ID="litExperimentCode" runat="server"></asp:Literal></td>
            <td class="InfoFieldName c3 col3">Date Started:&nbsp;</td>
            <td class="InfoFieldValue c3 col4">
                <asp:Literal ID="litDateStarted" runat="server"></asp:Literal>
            </td>
            <td class="InfoFieldName c3 col5"></td>
            <td class="InfoFieldValue c3 col6"></td>
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
            <td class="InfoFieldValue">
            </td>
            <td class="InfoFieldName">PI Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPICode" runat="server"></asp:Literal>
            </td>
        </tr>       
        <tr>
            <td class="InfoFieldName">Comments:&nbsp;</td>
            <td class="InfoFieldValue" colspan="3">
                <asp:TextBox ID="tbComments" runat="server" TextMode="MultiLine" Height="138px" 
                    Width="338px"></asp:TextBox>
                <a id="CommentsButton" onclick='SaveProperty("<%= Request.QueryString["eid"] %>", "Comment", "<%= tbComments.ClientID %>", "Experiment");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                <span id="Comment"></span>
            </td>
        </tr>
    </table>
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
   
    <asp:ImageButton ID="btnMakeNote" ImageUrl="~/Images/btn_addnote.png" runat="server" Text="Make Note" />
    
    <asp:ListView ID="lvInduction" runat="server">
        <LayoutTemplate>
            <table cellpadding="0" class="notes left">
                <tr class="head"><th colspan="2">Induction Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td class="date"><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span class="notes empty">No induction notes.</span>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:ListView ID="lvElongationGermination" runat="server">
        <LayoutTemplate>
            <table cellpadding="0" class="notes right">
                <tr class="head"><th colspan="2">Elongation/Germination Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td class="date"><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span class="notes empty">No Elongation/Germination notes.</span>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:ListView ID="lvRecallusing" runat="server">
        <LayoutTemplate>
            <table cellpadding="0" class="notes left">
                <tr class="head"><th colspan="2">Recallusing Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td class="date"><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span class="notes empty">No Recallusing notes.</span>
        </EmptyDataTemplate>    
    </asp:ListView>
    <asp:ListView ID="lvRooting" runat="server">
        <LayoutTemplate>
            <table cellpadding="0" class="notes right">
                <tr class="head"><th colspan="2">Rooting Notes</th></tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td class="date"><%# Eval("DateNote", "{0:MM/dd/yyyy}")%></td>
                <td><%# Eval("NoteText")%></td>
            </tr>
        </ItemTemplate>  
        <EmptyDataTemplate>
            <span class="notes empty">No Rooting notes.</span>
        </EmptyDataTemplate>  
    </asp:ListView>
    
    <AjaxControlToolkit:ModalPopupExtender ID="mpeMakeNote" runat="server" TargetControlID="btnMakeNote" PopupControlID="pnlMakeNote" CancelControlID="btnCancelMakeNote">
    </AjaxControlToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlMakeNote" CssClass="popup" runat="server" style="display:none;">
        <div class="close">
            <asp:ImageButton ID="btnCancelMakeNote" ToolTip="Close" ImageUrl="~/Images/btn_close.png" runat="server" Text="X" />
        </div>
    <h2>Add Note</h2>
        
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
                        Width="287px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:ImageButton ID="btnCreate" ImageUrl="~/Images/btn_create.png" runat="server" Text="Create" 
                        onclick="btnCreate_Click" /></td>
            </tr>
        </table>
<%--    <span class="bottom">&nbsp;
    </span>--%>
    </asp:Panel>
    <br /><br /><div class="clear">&nbsp;</div>
    <asp:ImageButton ID="btnAddPlant" runat="server" Text="Add Plant" 
        onclick="btnAddPlant_Click" ImageUrl="~/Images/btn_addplant.png" />
    
    <asp:ListView ID="lvPlants" runat="server" 
        onitemdatabound="lvPlants_ItemDataBound">
        <LayoutTemplate>
            <table id="dataTable" cellpadding="0" cellspacing="0" class="grid experiment">
                <tr class="head">
                    <th class="first" style="width: 25px;">&nbsp;</th>
                    <th>Pedigree</th>
                    <th>Date Entered</th>
                    <th>Re-Callusing<br />Assay</th>
                    <th>Rooting</th>
                    <th>Date Delivered</th>
                    <th>Status</th>
                    <th>Comments</th>
                </tr>
                <tr runat='server' id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id='<%# Eval("id") %>'>
                <td>&nbsp;</td>
                <td><%# Eval("Pedigree")%></td>
                <td><%# Eval("DateEntered", "{0:MM/dd/yyyy}")%></td>
                <td>
                    <asp:CheckBox ID="cbRecallusingAssay" runat="server" Checked='<%# Eval("ReCallusingAssay") %>' OnClick='ChangeCheckBox(this, "Recallusing")' />
                    
                    <img id='<%# Eval("id").ToString() + "RecallusingLoadingImg" %>'  src="../Images/mozilla_blu.gif" style="display:none;" />
                    <img id='<%# Eval("id").ToString() + "RecallusingConfirmImg" %>'src="../Images/confirm.png" style="display:none; width:16px; height:16px;" />
                    <img id='<%# Eval("id").ToString() + "RecallusingFailImg" %>' src="../Images/cancel.png" style="display:none; width:16px; height:16px;" />
                </td>
                <td>
                    <asp:CheckBox ID="cbRooting" runat="server" Checked='<%# Eval("Rooting") %>' OnClick='ChangeCheckBox(this, "Rooting")' />
                    
                    <img id='<%# Eval("id").ToString() + "RootingLoadingImg" %>'  src="../Images/mozilla_blu.gif" style="display:none;" />
                    <img id='<%# Eval("id").ToString() + "RootingConfirmImg" %>'src="../Images/confirm.png" style="display:none; width:16px; height:16px;" />
                    <img id='<%# Eval("id").ToString() + "RootingFailImg" %>' src="../Images/cancel.png" style="display:none; width:16px; height:16px;" />
                </td>
                <td>
                    <span id='<%# Eval("id").ToString() + "DateDelivered" %>'>
                        <%# Eval("DateDelivered", "{0:MM/dd/yyyy}")%>
                    </span>
                </td>
                <td>
                    
                        <asp:DropDownList ID="ddlChangeStatus" runat="server" 
                            DataSourceID="odsStatus" DataTextField="Name" 
                            DataValueField="ID" onChange='ChangeStatus(this)' >
                        </asp:DropDownList>
                        
                        <img id='<%# Eval("id").ToString() + "StatusLoadingImg" %>' src="../Images/mozilla_blu.gif" style="display:none;" />
                        <img id='<%# Eval("id").ToString() + "StatusConfirmImg" %>'src="../Images/confirm.png" style="display:none; width:16px; height:16px;" />
                        <img id='<%# Eval("id").ToString() + "StatusFailImg" %>' src="../Images/cancel.png" style="display:none; width:16px; height:16px;" />
                        
                        <asp:Literal ID="litStatus" runat="server" Visible="false"></asp:Literal>

                </td>
                <td>
                    <span id='<%# Eval("id") + "CommentText" %>' style="display:none;"><%# Eval("Comments")%></span>
                                                      
                    <a onclick='EditPlantComments(<%# Eval("id") %>, "<%= tbPlantID.ClientID %>", "<%= mpePlantNote.BehaviorID %>", "<%= tbPlantComment.ClientID %>", "<%# Eval("Comments") %>")'><img src="../Images/edit.png" alt="Edit" title="Click to Edit" /></a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:Button runat="server" ID="btnDummyPlantNote" Text="DUmmy" style="display:none;" />
    <AjaxControlToolkit:ModalPopupExtender ID="mpePlantNote" BehaviorID="mpePlantNote" runat="server" TargetControlID="btnDummyPlantNote" PopupControlID="pnlPlantNote" CancelControlID="lbCancelPlantNote">
    </AjaxControlToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlPlantNote" CssClass="popup" runat="server" style="display: none;">
        <h2>Plant Comments</h2>
        <asp:TextBox runat='server' ID="tbPlantID" style="display:none;" ></asp:TextBox>
        
        <div class="close">
            <asp:ImageButton ID="lbCancelPlantNote" ToolTip="Close" ImageUrl="~/Images/btn_close.png" runat="server" Text="X" />
        </div>
        
        <asp:TextBox ID="tbPlantComment" runat="server" TextMode="MultiLine" Height="138px" Width="338px"></asp:TextBox>
        <a id="SavePlantComments" onclick='SavePlantComments("<%= tbPlantID.ClientID %>", "PlantComment", "<%= tbPlantComment.ClientID %>", "Plant");'><img src="../Images/save.png" width="20px" alt="save" /></a>
        <span id="PlantComment"></span>
    </asp:Panel>
    
    <asp:ObjectDataSource ID="odsNoteTypes" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.NoteTypeBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsStatus" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlantStatus" 
        TypeName="CAESDO.PTF.BLL.StatusBLL"></asp:ObjectDataSource>    
        
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


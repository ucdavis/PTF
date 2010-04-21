﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="admin_Order" Title="PTF | Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../JS/CollapsibleTable.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="InfoTable">
        <tr>
            <td class="InfoFieldName">Order:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litOrderID" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Date Requested:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litDateRequested" runat="server"></asp:Literal></td>            
        </tr>
    </table>
    <br />
    <asp:Panel ID="pnlCustomerInfoHeader" runat="server" class="CollapsiblePanelHeader">
        <div style="float:left;">
            Customer Information
        </div>
        <div style="float: left; margin-left: 20px;">
            <asp:Label ID="lblCustomerInfoHeaderText" runat="server" Text="(Show Details...)"></asp:Label>
        </div>
        <div style="float:right; vertical-align:middle;">
            <asp:ImageButton ID="ibtnCustomerInfoToggle" runat="server" ImageUrl="~/Images/expand.jpg" AlternateText="(Show Details...)" />
        </div>
    </asp:Panel><br />
    <asp:Panel ID="pnlCustomerInfoBody" runat="server" class="CollapsiblePanelBody">
       <table class="InfoTable">
            <tr>
                <td class="InfoFieldName">PI:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litPI" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Contact Phone:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litContactPhone" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Contact:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litContact" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Contact Email:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litContactEmail" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Mailing Address:</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litMailing" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Shipping Address:</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litShipping" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Recharge Number:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litRechargeNumber" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Contract Executed:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litContractExecuted" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>
                <td class="InfoFieldName">Shipping Permit:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litShippingPermit" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>            
            </tr>
        </table>    
    </asp:Panel>
    <AjaxControlToolkit:CollapsiblePanelExtender ID="cpeCustomerInfo" 
        TargetControlID="pnlCustomerInfoBody" 
        CollapseControlID="pnlCustomerInfoHeader" ExpandControlID="pnlCustomerInfoHeader" 
        TextLabelID="lblCustomerInfoHeaderText" ImageControlID="ibtnCustomerInfoToggle"
        ExpandedText="(Hide Details...)"
        CollapsedText="(Show Details...)"
        ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        SuppressPostBack="true"
        runat="server">
    </AjaxControlToolkit:CollapsiblePanelExtender>
 
     <asp:Panel ID="pnlOrderInfoHeader" runat="server" class="CollapsiblePanelHeader">
        <div style="float:left;">
            Order Information
        </div>
        <div style="float: left; margin-left: 20px;">
            <asp:Label ID="lblOrderInfoHeaderText" runat="server" Text="(Show Details...)"></asp:Label>
        </div>
        <div style="float:right; vertical-align:middle;">
            <asp:ImageButton ID="ibtnOrderInfoToggle" runat="server" ImageUrl="~/Images/expand.jpg" AlternateText="(Show Details...)" />
        </div>
    </asp:Panel><br />
    <asp:Panel ID="pnlOrderInfoBody" runat="server" class="CollapsiblePanelBody">
        <table class="InfoTable">
            <tr>
                <td class="InfoFieldName">PI Code:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litPICode" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Construct Name:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litConstructName" runat="server"></asp:Literal></td>            
            </tr>        
            <tr>
                <td class="InfoFieldName">Plasmid:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litPlasmid" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Bacterial Selection:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litBacterialSelection" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Agro Strain:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litAgroStrain" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Transgene:&nbsp;</td>
                <td class="InfoFieldValue"><asp:Literal ID="litTransgene" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Trait:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litTrait" runat="server"></asp:Literal></td>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Selectable Marker Promoter:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litSelectableMarkerPromoter" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Selectable Marker Gene:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litSelectableMarkerGene" runat="server"></asp:Literal></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Additional Information:&nbsp;</td>
                <td class="InfoFieldValue" colspan="3">
                    <asp:Literal ID="litAdditionalInformation" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>            
            </tr>
            <tr>
                <td class="InfoFieldName">Working Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litWorkingBox" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Archived Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litArchivedBox" runat="server"></asp:Literal></td>            
            </tr>                                                                        
            <tr>
                <td class="InfoFieldName">Location:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litLocation" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Position:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litPosition" runat="server"></asp:Literal></td>            
            </tr>     
            <tr><td colspan="4"></td></tr>
            <tr>
                <td class="InfoFieldName">Comments:&nbsp;</td>
                <td class="InfoFieldValue" colspan="3">
                    <asp:Literal ID="litComments" runat="server"></asp:Literal></td>
            </tr>       
        </table>
    </asp:Panel>
     <AjaxControlToolkit:CollapsiblePanelExtender ID="cpeOrderInfo" 
        TargetControlID="pnlOrderInfoBody" 
        CollapseControlID="pnlOrderInfoHeader" ExpandControlID="pnlOrderInfoHeader" 
        TextLabelID="lblOrderInfoHeaderText" ImageControlID="ibtnOrderInfoToggle"
        ExpandedText="(Hide Details...)"
        CollapsedText="(Show Details...)"
        ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        SuppressPostBack="true"
        runat="server">
    </AjaxControlToolkit:CollapsiblePanelExtender>
 <br />
 
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>    
    <asp:Button ID="btnNewConstruct" runat="server" Text="Create Construct" />
    <asp:ListView ID="lvSuborders" runat="server">
        <LayoutTemplate>
            <div class="grid">
                <table id="suborders" cellpadding="10" cellspacing="0">
                    <tr class="head">
                        <th class="first"></th>
                        <th>Number of Plants</th>
                        <th>Crop</th>
                        <th>Plant Selection</th>
                        <th>Genotype</th>
                    </tr>
                    <tr runat='server' id="itemplaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id="row" runat='server' class="group" >
                <td class="first">
                    <img src="../images/plus.png" onclick="toggleGroup(this, '<%# Eval("Constructs.Count") %>', 'suborders');" />
                </td>
                <td><%# Eval("NumberOfPlants") %></td>
                <td><%# Eval("Crop.Name") %></td>
                <td><%# Eval("PlantSelection.Name") %></td>
                <td><%# Eval("GenoType.Name") %></td>
            </tr>
            <asp:ListView ID="lvConstructs" runat="server" DataSource='<%# Eval("Constructs") %>'>
                <LayoutTemplate>
                    <tr runat='server' id="itemplaceholder"></tr>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr id="row" runat="server" class="item hidden">
                        <td class="first" ></td>
                        <td><a href='<%# "Construct.aspx?cid=" + Eval("id") %>'><%# Eval("ConstructCode") %></a></td>
                        <td><%# Eval("DateCreated", "{0:d}") %></td>
                        <td><%# Eval("RechargeAmount") %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:ListView>
 
    <asp:Panel ID="pnlNewConstruct" runat="server" Width="400px" BorderWidth="1px" BorderStyle="Solid" BackColor="OldLace" style="display:none;">
        <div style="float:right;">
            <asp:Button ID="btnCancel" runat="server" Text="X" />
        </div>
        
        <br /><br />
        <asp:GridView ID="gvSuborder" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" onselectedindexchanged="gvSuborder_SelectedIndexChanged">
            <Columns>
                
                <asp:CommandField ShowSelectButton="True" />
                
                <asp:BoundField DataField="NumberOfPlants" HeaderText="# Plants" SortExpression="NumberOfPlants" />
                <asp:TemplateField HeaderText="Crop">
                    <ItemTemplate>
                        <%# Eval("Crop.Name") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Plant Selection">
                    <ItemTemplate>
                        <%# Eval("PlantSelection.Name") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Genotype">
                    <ItemTemplate>
                        <%# Eval("GenoType.Name") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <AjaxControlToolkit:ModalPopupExtender ID="mpeNewConstruct" runat="server" TargetControlID="btnNewConstruct" CancelControlID="btnCancel" PopupControlID="pnlNewConstruct">
    </AjaxControlToolkit:ModalPopupExtender>
</ContentTemplate>
</asp:UpdatePanel>    
</asp:Content>


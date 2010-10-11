<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="admin_Order" Title="PTF | Order" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript" src="../JS/CollapsibleTable.js"></script>
    <script type="text/javascript" src="../JS/Order.js"></script>

    <script type="text/javascript">
    function SaveAgroStrain(orderID, dropDown, literal)
    {
        var panel = $get(dropDown).parentNode;
        
        var value = $get(dropDown).options[$get(dropDown).selectedIndex].value;
        
        ScriptServices.SaveProperty(orderID, "AgroStrain", value, "Order", SaveSuborderPropertyOnComplete, SaveSuborderPropertyOnFail, $get(dropDown));
    }
    function SaveContractNumber() {       
        SaveProperty("<%= Request.QueryString["oid"] %>", "ContractNumber", "<%= tbContractNumber.ClientID %>", "Order");

        return false;
    }
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../Images/back.png" alt="" /> [Back to Orders]</asp:LinkButton>
    </div>

    

    <table class="InfoTable">
        <tr class="head">
            <td colspan="3" style="vertical-align: bottom">
                Order Information
            </td>
            <td style="text-align: right;">
                <asp:ImageButton ID="lbDelete" ImageUrl="../Images/btn_delete.png" AlternateText="Delete" runat="server" OnClick="lbDelete_Click" />
                <AjaxControlToolkit:ConfirmButtonExtender ID="lbDeleteConfirm" runat="server" TargetControlID="lbDelete" ConfirmText="Are you sure you want to delete this order?"></AjaxControlToolkit:ConfirmButtonExtender>
            </td>
        </tr>
        <tr>
            <td class="InfoFieldName col1">Order:&nbsp;</td>
            <td class="InfoFieldValue col2">
                <asp:Literal ID="litOrderID" runat="server"></asp:Literal></td>
            <td class="InfoFieldName col3">Date Requested:&nbsp;</td>
            <td class="InfoFieldValue col4">
                <asp:Literal ID="litDateRequested" runat="server"></asp:Literal></td>            
        </tr>
    </table>
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
                <td class="InfoFieldName col1">PI:&nbsp;</td>
                <td class="InfoFieldValue col2">
                    <asp:Literal ID="litPI" runat="server"></asp:Literal></td>
                <td class="InfoFieldName col3">Contact Phone:&nbsp;</td>
                <td class="InfoFieldValue col4">
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
                <td class="InfoFieldName">Contract Number:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbContractNumber" runat="server" Width="75px"></asp:TextBox>&nbsp;
                    <%--<a id="ContractNumberButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "ContractNumber", "<%= tbContractNumber.ClientID %>", "Order");' class="hidden"><img src="../Images/save.png" width="20px" alt="save" /></a>--%>
                    <asp:ImageButton ID="ibtnContractNumber" OnClientClick='return SaveContractNumber()' ImageUrl="~/Images/save.png"  Width="20px" AlternateText="save" runat="server" Visible="false" />
                    <span id="ContractNumber"></span>
                </td>            
            </tr>
            <tr>
                <td class="InfoFieldName"></td>
                <td class="InfoFieldValue"></td>
                <td class="InfoFieldName">Shipping Permit:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litShippingPermit" runat="server"></asp:Literal></td>            
            </tr>
<%--           <asp:Panel ID="pnlUcdBua" runat="server">
           <tr>
                <td class="InfoFieldName">Bua Number:</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litBua" runat="server"></asp:Literal></td>
                <td class="InfoFieldName">Bua Expiration:</td>
                <td class="InfoFieldValue">
                    <asp:Literal ID="litBuaExpiration" runat="server"></asp:Literal></td>            
            </tr>
            </asp:Panel>
           <asp:Panel ID="pnlNonUcdBua" runat="server">
                <tr>
                    <td class="InfoFieldName">Has Bua:</td>
                    <td class="InfoFieldValue">
                        <asp:Literal ID="litHasBua" runat="server"></asp:Literal></td>
                    <td class="InfoFieldName"></td>
                    <td class="InfoFieldValue"></td>            
                </tr>
           </asp:Panel>--%>
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
                <td class="InfoFieldName col1">PI Code:&nbsp;</td>
                <td class="InfoFieldValue col2">
                    <asp:Literal ID="litPICode" runat="server"></asp:Literal></td>
                <td class="InfoFieldName col3">Construct Name:&nbsp;</td>
                <td class="InfoFieldValue col4">
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
                    <asp:Literal ID="litAgroStrain" runat="server"></asp:Literal>
                    <asp:Panel runat="server" id="pnlAgroStrain" Visible="false">
                        <asp:DropDownList ID="ddlAgroStrain" runat="server" DataValueField="id" DataTextField="Name" AppendDataBoundItems="true"></asp:DropDownList>
                        <a id="AgroStrainButton" onclick='SaveAgroStrain("<%= Request.QueryString["oid"] %>", "<%= ddlAgroStrain.ClientID %>", "<%= litAgroStrain.ClientID %>");'><img src="../Images/save.png" width="20px" alt="save" /></a></asp:Panel>
                </td>
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
                    <asp:TextBox ID="tbWorkingBox" runat="server" Width="75px"></asp:TextBox>
                    <a id="WorkingBoxButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "WorkingBox", "<%= tbWorkingBox.ClientID %>", "Order");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                    <span id="WorkingBox"></span>
                </td>
                <td class="InfoFieldName">Archived Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbArchivedBox" runat="server" Width="75px"></asp:TextBox>
                    <a id="ArchivedBoxbutton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "ArchivedBox", "<%= tbArchivedBox.ClientID %>", "Order");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                    <span id="ArchivedBox"></span>
                </td>            
            </tr>                                                                        
            <tr>
                <td class="InfoFieldName">Location:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbLocation" runat="server" Width="75px"></asp:TextBox>
                    <a id="LocationButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Location", "<%= tbLocation.ClientID %>", "Order");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                    <span id="Location"></span>
                </td>
                <td class="InfoFieldName">Position:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbPosition" runat="server" Width="75px"></asp:TextBox>
                    <a id="PositionButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Position", "<%= tbPosition.ClientID %>", "Order");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                    <span id="Position"></span>
                </td>            
            </tr>     
            <tr><td colspan="4"></td></tr>
            <tr>
                <td class="InfoFieldName">Comments&nbsp;(Public Viewable):&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbComments" runat="server" TextMode="MultiLine" Height="138px" 
                        Width="80%"></asp:TextBox>
                    <a id="CommentsButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Comment", "<%= tbComments.ClientID %>", "Order");'><img src="../Images/save.png" width="20px" alt="save" /></a>
                    <span id="Comment"></span>
                </td>
                <td class="InfoFieldName">&nbsp;</td>
                <td class="InfoFieldValue">&nbsp;</td>
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
    <asp:Button ID="btnNewConstruct" runat="server" Text="" />
    <asp:Button ID="btnAddSuborder" runat="server" Text="Add Suborder" onclick="btnAddSuborder_Click" />
    <asp:ListView ID="lvSuborders" runat="server" 
        onitemdatabound="lvSuborders_ItemDataBound">
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
                    <img src="../images/minus.png" onclick="toggleGroup(this, 1, 'suborders');" />
                </td>
                <td><%# Eval("NumberOfPlants") %></td>
                <td><%# Eval("Crop.Name") %></td>
                <td>
                    <div>
                        <asp:Literal ID="litPlantSelection" runat="server"></asp:Literal>
                        <asp:Panel runat="server" ID="pnlPlantSelection" Visible="false">
                        <asp:DropDownList ID="ddlPlantSelection" runat="server" DataValueField="id" DataTextField="Name">
                        </asp:DropDownList>
                        <a id="PlantSelectionButton" onclick='SaveSuborderProperty("<%# Eval("id") %>", this, "PlantSelection");'><img src="../Images/save.png" width="20px" alt="save" /></a></asp:Panel>
                    </div>
                </td>
                <td>
                    <asp:Literal ID="litGenotype" runat="server"></asp:Literal>
                    <asp:Panel runat="server" id="pnlGenotype" Visible="false">
                    <asp:DropDownList ID="ddlGenotype" runat="server" DataValueField="id" DataTextField="Name"></asp:DropDownList>
                    <a id="GenotypeButton" onclick='SaveSuborderProperty("<%# Eval("id") %>", this, "Genotype");'><img src="../Images/save.png" width="20px" alt="save" /></a></asp:Panel>
                </td>
            </tr>
            <tr id="row" class="item">
                <td class="first"></td>
                <td colspan="4">
                    <asp:ListView ID="lvConstructs" runat="server" DataSource='<%# Eval("Constructs") %>'>
                        <LayoutTemplate>
                            <table>
                                <tr>
                                    <th>Construct Code</th>
                                    <th>Date Created</th>
                                    <th>Recharge Amount</th>
                                    <th>Status</th>
                                </tr>
                                <tr runat='server' id="itemplaceholder"></tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr id="row2" runat="server" class="item">
                                <td class="firstnum"><a href='<%# "Construct.aspx?cid=" + Eval("id") %>'><%# Eval("ConstructCode") %></a></td>
                                <td><%# Eval("DateCreated", "{0:d}") %></td>
                                <td><%# Eval("RechargeAmount") %></td>
                                <td><%# Eval("Status.Name") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
 
    <asp:Panel ID="pnlNewConstruct" runat="server" style="display:none;">
    <div class="popup">
        <div class="close">
            <asp:ImageButton ID="btnCancel" ToolTip="Close" ImageUrl="~/Images/btn_close.png" runat="server" Text="X" />
        </div>
    <h2>New Construct</h2>
               
        <asp:ListView ID="lvSubOrder" runat="server" DataKeyNames="id" OnItemDataBound="lvSuborder_ItemDataBound" >
            <LayoutTemplate>
            <div class="grid">
                <table cellpadding="15" cellspacing="0" class="InfoTable">
                    <tr class="head">
                        <th></th>
                        <th>Crop</th>
                        <th>Plant Selection</th>
                        <th>Genotype</th>
                    </tr>
                    <tr runat="server" id="ItemPlaceHolder"></tr>
                </table>
            </div>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:LinkButton ID="lbSelect" OnCommand="lbSelectOnCommand" CommandArgument='<%# Eval("id") %>' runat="server"><img src="../Images/btn_select.png" alt="Select" /></asp:LinkButton></td>
                    <td><%# Eval("Crop.Name") %></td>
                    <td><%# Eval("PlantSelection.Name") %></td>
                    <td><%# Eval("GenoType.Name") %></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <p class="popup_bottom">&nbsp;</p>
    </asp:Panel>
    <AjaxControlToolkit:ModalPopupExtender ID="mpeNewConstruct" runat="server" BackgroundCssClass="popup_shadow" TargetControlID="btnNewConstruct" CancelControlID="btnCancel" PopupControlID="pnlNewConstruct">
    </AjaxControlToolkit:ModalPopupExtender>
</ContentTemplate>
</asp:UpdatePanel> 

    <script type="text/javascript">
    
        var isReader = "<%= User.IsInRole("Reader") %>";
                
        if (isReader == "True")
        {
            $get("ContractNumberButton").style.display = "none";
        
            $get("WorkingBoxButton").style.display = "none";
            $get("ArchivedBoxbutton").style.display = "none";
            $get("LocationButton").style.display = "none";
            $get("PositionButton").style.display = "none";
            $get("CommentsButton").style.display = "none";
        }
    
    
    </script>

</asp:Content>


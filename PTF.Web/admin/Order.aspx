<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="admin_Order" Title="PTF | Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../JS/CollapsibleTable.js"></script>
<script type="text/javascript" src="../JS/Order.js"></script>

<script type="text/javascript">
    function SaveContractNumber()
    {    
        var contractNumber = $get('<%= tbContractNumber.ClientID %>').value;
    
        PageMethods.SaveContractNumber('<%= Request.QueryString["oid"] %>', contractNumber, ExecuteContractOnComplete, null, contractNumber);
    }
    
    function ExecuteContractOnComplete(result, context)
    {
        $get("ContractExecuted").innerHTML = context;
        $get('<%= tbContractNumber.ClientID %>').style.display = "none";
        $get('<%= lbContractNumber.ClientID %>').style.display = "none";
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="InfoTable">
        <tr>
            <td class="InfoFieldName col1">Order:&nbsp;</td>
            <td class="InfoFieldValue col2">
                <asp:Literal ID="litOrderID" runat="server"></asp:Literal></td>
            <td class="InfoFieldName col3">Date Requested:&nbsp;</td>
            <td class="InfoFieldValue col4">
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
                    <div id="ContractExecuted"><asp:Literal ID="litContractExecuted" runat="server"></asp:Literal></div>
                    <asp:TextBox ID="tbContractNumber" runat="server" Visible="false"></asp:TextBox>&nbsp;
                    <asp:LinkButton ID="lbContractNumber" runat="server" OnClientClick="SaveContractNumber(); return false;" Visible="false"><img src="../Images/save.png" width="15px" alt="save" /></asp:LinkButton>
                </td>            
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
                    <asp:TextBox ID="tbWorkingBox" runat="server"></asp:TextBox>
                    <a id="WorkingBoxButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "WorkingBox", "<%= tbWorkingBox.ClientID %>", "Order");'><img src="../Images/save.png" width="15px" alt="save" /></a>
                    <span id="WorkingBox"></span>
                </td>
                <td class="InfoFieldName">Archived Box:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbArchivedBox" runat="server"></asp:TextBox>
                    <a id="ArchivedBoxbutton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "ArchivedBox", "<%= tbArchivedBox.ClientID %>", "Order");'><img src="../Images/save.png" width="15px" alt="save" /></a>
                    <span id="ArchivedBox"></span>
                </td>            
            </tr>                                                                        
            <tr>
                <td class="InfoFieldName">Location:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbLocation" runat="server"></asp:TextBox>
                    <a id="LocationButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Location", "<%= tbLocation.ClientID %>", "Order");'><img src="../Images/save.png" width="15px" alt="save" /></a>
                    <span id="Location"></span>
                </td>
                <td class="InfoFieldName">Position:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="tbPosition" runat="server"></asp:TextBox>
                    <a id="PositionButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Position", "<%= tbPosition.ClientID %>", "Order");'><img src="../Images/save.png" width="15px" alt="save" /></a>
                    <span id="Position"></span>
                </td>            
            </tr>     
            <tr><td colspan="4"></td></tr>
            <tr>
                <td class="InfoFieldName">Comments&nbsp;(Public Viewable):&nbsp;</td>
                <td class="InfoFieldValue" colspan="3">
                    <asp:TextBox ID="tbComments" runat="server" TextMode="MultiLine" Height="138px" 
                        Width="338px"></asp:TextBox>
                    <a id="CommentsButton" onclick='SaveProperty("<%= Request.QueryString["oid"] %>", "Comment", "<%= tbComments.ClientID %>", "Order");'><img src="../Images/save.png" width="15px" alt="save" /></a>
                    <span id="Comment"></span>
                </td>
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
                    <img src="../images/minus.png" onclick="toggleGroup(this, 1, 'suborders');" />
                </td>
                <td><%# Eval("NumberOfPlants") %></td>
                <td><%# Eval("Crop.Name") %></td>
                <td><%# Eval("PlantSelection.Name") %></td>
                <td><%# Eval("GenoType.Name") %></td>
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
                                <td><a href='<%# "Construct.aspx?cid=" + Eval("id") %>'><%# Eval("ConstructCode") %></a></td>
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


    <script type="text/javascript">
    
        var isReader = "<%= User.IsInRole("Reader") %>";
                
        if (isReader == "True")
        {
            $get("WorkingBoxButton").style.display = "none";
            $get("ArchivedBoxbutton").style.display = "none";
            $get("LocationButton").style.display = "none";
            $get("PositionButton").style.display = "none";
            $get("CommentsButton").style.display = "none";
        }
    
    
    </script>

</asp:Content>


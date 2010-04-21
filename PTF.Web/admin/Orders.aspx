<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
        .grid
        {
         	border:solid 2px #a5a4bd;        	
        	font-family:Tahoma;
        	font-size:12px;
        }
        .grid H2
         {
         	background:#8988a5 url(_assets/img/title-bg.gif);
         	border-bottom:solid 1px #57566f;
         	height:28px;
         	line-height:28px;
         	margin:0px;
         	padding:0px 0px 0px 5px;
        	color:#fff;
        	font-size:15px;
         }
         .grid TABLE
         {
         }
         
         /* grid headers */
         .grid #orders .head TH
         {
         	background:#e9e9eb url(_assets/img/header-bg.gif);
         	height:24px;
         	line-height:24px;
         	padding-left:6px;
         	color:#666666;
         	text-align:left;
         }
         .grid #orders .head TH.first
         {
         	/* get rid of the first slash */
         	background:#e9e9eb url(_assets/img/header-bg.gif) -3px;
         	width:20px;
         } 
         
         /* group header */
         .grid #orders .group TH
         {
         	padding:10px 0px 2px 0px;
         	color:#666666;
         	text-align:left;
         	border-bottom:solid 2px #a5a4bd;
         } 
         .grid #orders .group TH.first
         {
         	text-align:center;         	
         	border-bottom:none;
         }              
         
         /* data items */                                       
         .grid #orders .item TD
         {
         	padding:3px 0px 3px 6px;
         	border-bottom:solid 1px #eae9e1; 
         	color:#222222;       	
         } 
         
         /* pager */    
        .grid #pager .pager TD
        {
        	height:40px;
        }  
        .grid #pager .pager .commands
        {
        	height:40px;
            padding:4px 0px 0px 25px;
        }               
        .grid #pager .pager .info
        {
            padding:4px 25px 0px 0px;
        	text-align:right;
        }       
        .hidden
        {
        	display:none;
        	visibility:hidden;
        }    
</style>
<script type="text/javascript">
        function toggleGroup(img, numberOfRows){
            //  get a reference to the row and table
            var tr = img.parentNode.parentNode;
            var table = $get('orders');
            var src = img.src;
            
            //  do some simple math to determine how many
            //  rows we need to hide/show
            var startIndex = tr.rowIndex + 1;
            var stopIndex = startIndex + parseInt(numberOfRows);
            
            //  if the img src ends with plus, then we are expanding the
            //  rows.  go ahead and remove the hidden class from the rows
            //  and update the image src
            if(src.endsWith('plus.png')){
                for(var i = startIndex; i < stopIndex; i++){
                    Sys.UI.DomElement.removeCssClass(table.rows[i], 'hidden');
                }
            
                src = src.replace('plus.png', 'minus.png');
            }
            else{
                for(var i = startIndex; i < stopIndex; i++){
                    Sys.UI.DomElement.addCssClass(table.rows[i], 'hidden');
                }
                            
                src = src.replace('minus.png', 'plus.png');
            }
            
            //  update the src with the new value
            img.src = src;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders">
        <LayoutTemplate>
            <div class="grid">
                <table id="orders" cellpadding="10" cellspacing="0">
                    <tr class="head">
                        <th class="first"></th>
                        <th>Order ID</th>
                        <th>PI</th>
                        <th>Contact Name</th>
                        <th>Contact E-mail</th>
                        <th>Construct Name</th>
                        <th>PI Code</th>
                        <th>Date Requested</th>
                        <th># Constructs</th>
                        <th>Status</th>
                    </tr>
                    <tr id="ItemPlaceHolder" runat="server"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id="row" runat="server" class="group">
                <td class="first">
                    <img src="../images/plus.png" onclick="toggleGroup(this, '<%# Eval("SubOrders.Count") %>');" />
                </td>
                <td><a href='<%# "Order.aspx?oid=" + Eval("ID") %>'><%# Eval("ID") %></a></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("PIConstructName") %></td>
                <td><%# Eval("PICode") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("Constructs.Count") %></td>
                <td></td>
            </tr>
                <asp:ListView ID="lvSubOrders" runat="server" DataSource='<%# Eval("SubOrders") %>'>
                    <LayoutTemplate>
                        <tr runat="server" id="itemplaceholder"></tr>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server" class="item hidden">
                            <td class="first">
                            </td>
                            <td colspan="2"><%# "# Plants: " + Eval("NumberOfPlants") %></td>
                            <td colspan="2"><%# "Crop: " + Eval("Crop.Name") %></td>
                            <td colspan="2"><%# "Plant Selection: " + Eval("PlantSelection.Name") %></td>
                            <td colspan="2"><%# "Genotype: " + Eval("Genotype.Name") %></td>
                            <td>
                                <%# "# Constructs: " + Eval("Constructs.Count") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.OrderBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="DateRequested" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="true" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    

</asp:Content>


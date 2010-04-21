<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Constructs.aspx.cs" Inherits="admin_ExistingData_Constructs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
        .WrapperDiv {
            width:800px;height:auto;
        }        
        .WrapperDiv TH {
            position:relative;
        }
        .WrapperDiv TR 
        {
	        /* Needed for IE */
            height:0px;
        } 
    </style>
    <script type="text/javascript">
        window.onload
        {
            //FreezeGridViewHeader('constructs','WrapperDiv');
        }
        
        function FreezeGridViewHeader(gridID,wrapperDivCssClass) 
        {
            /// <summary>
            ///   Used to create a fixed GridView header and allow scrolling
            /// </summary>
            /// <param name="gridID" type="String">
            ///   Client-side ID of the GridView control
            /// </param>
            /// <param name="wrapperDivCssClass" type="String">
            ///   CSS class to be applied to the GridView's wrapper div element.  
            ///   Class MUST specify the CSS height and width properties.  
            ///   Example: width:800px;height:400px;border:1px solid black;
            /// </param>
            var grid = document.getElementById(gridID);
            if (grid != 'undefined')
            {
                grid.style.visibility = 'hidden';
                var div = null;
                if (grid.parentNode != 'undefined') 
                {
                    //Find wrapper div output by GridView
                    div = grid.parentNode;
                    if (div.tagName == "DIV")
                    {
                        div.className = wrapperDivCssClass;  
                        div.style.overflow = "none";                   
                    }
                }                
                //Find DOM TBODY element and remove first TR tag from 
                //it and add to a THEAD element instead so CSS styles
                //can be applied properly in both IE and FireFox
                var tags = grid.getElementsByTagName('TBODY');
                if (tags != 'undefined')
                {
                    var tbody = tags[0];
                    var trs = tbody.getElementsByTagName('TR');
                    var headerHeight = 8;
                    if (trs != 'undefined') 
                    {
                        headerHeight += trs[0].offsetHeight;
                        var headTR = tbody.removeChild(trs[0]);
                        var head = document.createElement('THEAD');
                        head.appendChild(headTR);
                        grid.insertBefore(head, grid.firstChild);
                    }
                    //Needed for Firefox
                    tbody.style.height = 
                      (div.offsetHeight -  headerHeight) + 'px';
                    tbody.style.overflowX = "hidden";
                    tbody.overflow = 'auto';
                    tbody.overflowX = 'hidden';
                }
                grid.style.visibility = 'visible';
            }
        }
    </script>

<script type="text/javascript" src="../../JS/ExistingData.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs">
        <LayoutTemplate>
            <table id="constructs">
                    <tr>
                        <th scope="col">Construct_Code</th>
                        <th scope="col">__of_Plants_Requested</th>
                        <th scope="col">__Plants_Delivered</th>
                        <th scope="col">Transformation_Initiated</th>
                        <th scope="col">PI_Construct_name</th>
                        <th scope="col">Agro_Strains</th>
                        <th scope="col">PI_Code</th>
                        <th scope="col">Bacterial_Selection</th>
                        <th scope="col">Plasmid</th>
                        <th scope="col">Trait</th>
                        <th scope="col">Gene_of_interest</th>
                        <th scope="col">Plant_Selection</th>
                        <th scope="col">PI</th>
                        <th scope="col">Client</th>
                        <th scope="col">Archived_Box</th>
                        <th scope="col">Position</th>
                        <th scope="col">Working_Box</th>
                        <th scope="col">Location</th>
                        <th scope="col">Target_Crop</th>
                        <th scope="col">Cultivar</th>
                        <th scope="col">Available_for_UC_researchers</th>
                        <th scope="col">Comment</th>
                        <th scope="col">Recharge_Number</th>
                        <th scope="col">Recharge_Amount</th>
                        <th scope="col">Contract_Executed</th>
                        <th scope="col">Status</th>
                        <th scope="col">Invoice_sent</th>
                        <th scope="col">Date_Received</th>
                    </tr>
                    <tr runat="server" id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("Construct_Code") %>'>
                <td><%# Eval("Construct_Code")%></td>
                <td><%# Eval("__of_Plants_Requested")%></td>
                <td><%# Eval("__Plants_Delivered")%></td>
                <td><%# Eval("Transformation_Initiated")%></td>
                <td><%# Eval("PI_Construct_name")%></td>
                <td><%# Eval("Agro_Strains")%></td>
                <td><%# Eval("PI_Code")%></td>
                <td><%# Eval("Bacterial_Selection")%></td>
                <td><%# Eval("Plasmid")%></td>
                <td><%# Eval("Trait")%></td>
                <td><%# Eval("Gene_of_interest")%></td>
                <td><%# Eval("Plant_Selection")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("Archived_Box")%></td>
                <td><%# Eval("Position")%></td>
                <td><%# Eval("Working_Box")%></td>
                <td><%# Eval("Location")%></td>
                <td><%# Eval("Target_Crop")%></td>
                <td><%# Eval("Cultivar")%></td>
                <td><%# Eval("Available_for_UC_researchers")%></td>
                <td><%# Eval("Comment")%></td>
                <td><%# Eval("Recharge_Number")%></td>
                <td><%# Eval("Recharge_Amount")%></td>
                <td><%# Eval("Contract_Executed") %></td>
                <td><%# Eval("Status") %></td>
                <td><%# Eval("Invoice_sent") %></td>
                <td><%# Eval("Date_Received") %></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="ExistingDataAltRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("Construct_Code") %>'>
                <td><%# Eval("Construct_Code")%></td>
                <td><%# Eval("__of_Plants_Requested")%></td>
                <td><%# Eval("__Plants_Delivered")%></td>
                <td><%# Eval("Transformation_Initiated")%></td>
                <td><%# Eval("PI_Construct_name")%></td>
                <td><%# Eval("Agro_Strains")%></td>
                <td><%# Eval("PI_Code")%></td>
                <td><%# Eval("Bacterial_Selection")%></td>
                <td><%# Eval("Plasmid")%></td>
                <td><%# Eval("Trait")%></td>
                <td><%# Eval("Gene_of_interest")%></td>
                <td><%# Eval("Plant_Selection")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("Archived_Box")%></td>
                <td><%# Eval("Position")%></td>
                <td><%# Eval("Working_Box")%></td>
                <td><%# Eval("Location")%></td>
                <td><%# Eval("Target_Crop")%></td>
                <td><%# Eval("Cultivar")%></td>
                <td><%# Eval("Available_for_UC_researchers")%></td>
                <td><%# Eval("Comment")%></td>
                <td><%# Eval("Recharge_Number")%></td>
                <td><%# Eval("Recharge_Amount")%></td>
                <td><%# Eval("Contract_Executed") %></td>
                <td><%# Eval("Status") %></td>
                <td><%# Eval("Invoice_sent") %></td>
                <td><%# Eval("Date_Received") %></td>
            </tr>
        </AlternatingItemTemplate>
    </asp:ListView>
</div>
    <asp:ObjectDataSource ID="odsConstructs" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllConstructs" 
        SortParameterName="sortExp"
        TypeName="CAESDO.PTF.BLL.ExistingBLL">
        <SelectParameters>
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <script type="text/javascript">
        FreezeGridViewHeader('constructs','WrapperDiv');
    </script>
</asp:Content>


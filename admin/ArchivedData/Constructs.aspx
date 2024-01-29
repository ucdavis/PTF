<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Constructs.aspx.cs" Inherits="admin_ArchivedData_Constructs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<%--    <link rel="Stylesheet" type="text/css" href="../../CSS/ingrid.css" media="screen" />
    <script type="text/javascript" src="../../JS/jquery-1.2.js"></script>
    <script type="text/javascript" src="../../JS/jquery.ingrid-0.9.2.js"></script>--%>

    <script type="text/javascript" src="../../JS/ExistingData.js"></script>

    <style type="text/css">

    div.ListViewContainer {
	    width: 100%; /* Table width will be 99% of this */
	    height: 500px; /* Must be greater than tbody */
	    overflow: auto;
	    }

    table {
	    width: 99%; /* 100% of container produces horizontal scroll in Mozilla */
	    border: none;
	    }
    	
    table>tbody	{ /* Child selector syntax which IE6 and older do not support */
	    overflow: auto; 
	    height: 350px;
	    overflow-x: hidden;
	    }
    	
    thead tr {
	    position:relative; 
	    top: expression(offsetParent.scrollTop); /* For IE5+ only */
	    }
    	
    thead td {
	    background-color: #CCCCCC;
	    font-weight: bold;
	    }	
    	
    td {
        color: #000000;
        text-align: left;
        }
    	
    table tfoot tr {
          position: relative; 
          overflow-x: hidden;
          top: expression(parentNode.parentNode.offsetHeight >= offsetParent.offsetHeight ? 0 - parentNode.parentNode.offsetHeight + offsetParent.offsetHeight + offsetParent.scrollTop : 0);
          }

    tfoot td {
        background-color: #CCCCCC;
        }

    td:last-child { /* Prevent Mozilla scrollbar from hiding cell content */
        padding-right: 20px;
        }

    </style>    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--    <script type="text/javascript">
    $(document).ready(
	    function() {
		    $("#constructs").ingrid({ 
			    url: 'remote.html',
			    height: 350
		    });
	    }
    ); 
    </script>--%>

<div class="ListViewContainer">

    <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs">
        <LayoutTemplate>
            <table id="constructs" border=1 cellpadding=1 cellspacing=1>
                <thead>
                    <tr>
                        <td>Construct_Code</td>
                        <td>__of_Plants_Requested</td>
                        <td>__Plants_Delivered</td>
                        <td>Transformation_Initiated</td>
                        <td>PI_Construct_name</td>
                        <td>Agro_Strains</td>
                        <td>PI_Code</td>
                        <td>Bacterial_Selection</td>
                        <td>Plasmid</td>
                        <td>Trait</td>
                        <td>Gene_of_interest</td>
                        <td>Plant_Selection</td>
                        <td>PI</td>
                        <td>Client</td>
                        <td>Archived_Box</td>
                        <td>Position</td>
                        <td>Working_Box</td>
                        <td>Location</td>
                        <td>Target_Crop</td>
                        <td>Cultivar</td>
                        <td>Available_for_UC_researchers</td>
                        <td>Comment</td>
                        <td>Recharge_Number</td>
                        <td>Recharge_Amount</td>
                        <td>Contract_Executed</td>
                        <td>Status</td>
                        <td>Invoice_sent</td>
                        <td>Date_Received</td>
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" id="ItemPlaceHolder"></tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="28">This is the footer row.</td>
                    </tr>
                </tfoot>
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

</asp:Content>


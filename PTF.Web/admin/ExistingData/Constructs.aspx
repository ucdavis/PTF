<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Constructs.aspx.cs" Inherits="admin_ExistingData_Constructs" Title="PTF | Archived Constructs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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


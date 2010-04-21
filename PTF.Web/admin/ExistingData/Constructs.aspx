<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Constructs.aspx.cs" Inherits="admin_ExistingData_Constructs" Title="PTF | Archived Constructs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../../JS/ExistingData.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs">
        <LayoutTemplate>
            <table id="constructs" class="InfoTable">
                    <tr>
                        <th scope="col">Construct Code</th>
                        <th scope="col"># Plants Requested</th>
                        <th scope="col"># Plants Delivered</th>
                        <th scope="col">Transformation Initiated</th>
                        <th scope="col">PI Construct name</th>
                        <th scope="col">Agro Strains</th>
                        <th scope="col">PI Code</th>
                        <th scope="col">Bacterial Selection</th>
                        <th scope="col">Plasmid</th>
                        <th scope="col">Trait</th>
                        <th scope="col">Gene of interest</th>
                        <th scope="col">Plant Selection</th>
                        <th scope="col">PI</th>
                        <th scope="col">Client</th>
                        <th scope="col">Archived Box</th>
                        <th scope="col">Position</th>
                        <th scope="col">Working Box</th>
                        <th scope="col">Location</th>
                        <th scope="col">Target Crop</th>
                        <th scope="col">Cultivar</th>
                        <th scope="col">Available for UC researchers</th>
                        <th scope="col">Comment</th>
                        <th scope="col">Recharge #</th>
                        <th scope="col">Recharge Amt</th>
                        <th scope="col">Contract Executed</th>
                        <th scope="col">Status</th>
                        <th scope="col">Invoice sent</th>
                        <th scope="col">Date Rec'd</th>
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
                <td><%# Eval("Invoice_sent", "{0:M/d/yy h:mm tt}") %></td>
                <td class="last"><%# Eval("Date_Received", "{0:M/d/yy h:mm tt}") %></td>
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
                <td><%# Eval("Invoice_sent", "{0:M/d/yy h:mm tt}") %></td>
                <td class="last"><%# Eval("Date_Received", "{0:M/d/yy h:mm tt}") %></td>
            </tr>
        </AlternatingItemTemplate>
    </asp:ListView>

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


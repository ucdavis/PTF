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
                        <th scope="col">Agrobacterium Selection</th>
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
            <tr class="ExistingDataRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("id") %>'>
                <td><%# Eval("id")%></td>
                <td><%# Eval("NumPlantsRequested")%></td>
                <td><%# Eval("NumPlantsDelivered")%></td>
                <td><%# Eval("TransformationInitiated")%></td>
                <td><%# Eval("PIConstructName")%></td>
                <td><%# Eval("AgroStrains")%></td>
                <td><%# Eval("PICode")%></td>
                <td><%# Eval("BacterialSelection")%></td>
                <td><%# Eval("Plasmid")%></td>
                <td><%# Eval("Trait")%></td>
                <td><%# Eval("GeneOfInterest")%></td>
                <td><%# Eval("PlantSelection")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("ArchivedBox")%></td>
                <td><%# Eval("Position")%></td>
                <td><%# Eval("WorkingBox")%></td>
                <td><%# Eval("Location")%></td>
                <td><%# Eval("TargetCrop")%></td>
                <td><%# Eval("Cultivar")%></td>
                <td><%# Eval("AvailableForUCResearch")%></td>
                <td><%# Eval("Comment")%></td>
                <td><%# Eval("RechargeNumber")%></td>
                <td><%# Eval("RechargeAmount")%></td>
                <td><%# Eval("ContractExecuted") %></td>
                <td><%# Eval("Status") %></td>
                <td><%# Eval("InvoiceSent", "{0:M/d/yy h:mm tt}") %></td>
                <td class="last"><%# Eval("DateReceived", "{0:M/d/yy h:mm tt}") %></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="ExistingDataAltRow" onclick="ChangeHighlight(this)" onmouseover="OnMouseOver(this)" onmouseout="OnMouseOut(this)" id='<%# Eval("id") %>'>
                <td><%# Eval("id")%></td>
                <td><%# Eval("NumPlantsRequested")%></td>
                <td><%# Eval("NumPlantsDelivered")%></td>
                <td><%# Eval("TransformationInitiated")%></td>
                <td><%# Eval("PIConstructName")%></td>
                <td><%# Eval("AgroStrains")%></td>
                <td><%# Eval("PICode")%></td>
                <td><%# Eval("BacterialSelection")%></td>
                <td><%# Eval("Plasmid")%></td>
                <td><%# Eval("Trait")%></td>
                <td><%# Eval("GeneOfInterest")%></td>
                <td><%# Eval("PlantSelection")%></td>
                <td><%# Eval("PI")%></td>
                <td><%# Eval("Client")%></td>
                <td><%# Eval("ArchivedBox")%></td>
                <td><%# Eval("Position")%></td>
                <td><%# Eval("WorkingBox")%></td>
                <td><%# Eval("Location")%></td>
                <td><%# Eval("TargetCrop")%></td>
                <td><%# Eval("Cultivar")%></td>
                <td><%# Eval("AvailableForUCResearch")%></td>
                <td><%# Eval("Comment")%></td>
                <td><%# Eval("RechargeNumber")%></td>
                <td><%# Eval("RechargeAmount")%></td>
                <td><%# Eval("ContractExecuted") %></td>
                <td><%# Eval("Status") %></td>
                <td><%# Eval("InvoiceSent", "{0:M/d/yy h:mm tt}") %></td>
                <td class="last"><%# Eval("DateReceived", "{0:M/d/yy h:mm tt}") %></td>
            </tr>
        </AlternatingItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="odsConstructs" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll"
        TypeName="CAESDO.PTF.BLL.ArchivedConstructBLL">
    </asp:ObjectDataSource>
    
    <script type="text/javascript">
        FreezeGridViewHeader('constructs','WrapperDiv');
    </script>
</asp:Content>


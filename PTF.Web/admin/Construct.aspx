<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Construct.aspx.cs" Inherits="admin_Construct" Title="PTF | Constructs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .OrderInfoFieldName
        {
            text-align: right;
            width: 375px;
            font-weight: bold;
        }
        .OrderInfoFieldValue
        {
            text-align: left;
            width: 300px;
        }
        .style1
        {
            width: 705px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlOrderDetails" runat="server" Visible="false">    
    <table class="style1">
        <tr>
            <td class="OrderInfoFieldName">
                OrderID:&nbsp;
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
            </td>
            <td class="OrderInfoFieldName">
                Contact:&nbsp;</td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblContact" runat="server" Text=""></asp:Label>
                ( <asp:Label ID="lblContactEmail" runat="server" Text=""></asp:Label> )  
            </td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                PI:&nbsp;
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblPI" runat="server" Text=""></asp:Label>
            </td>
            <td class="OrderInfoFieldName">
                Contact Phone:&nbsp;
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblContactPhone" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                Bacterial Selection:&nbsp; 
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblBacterialSelection" runat="server" Text=""></asp:Label>
            </td>
            <td class="OrderInfoFieldName">
                Address:&nbsp;
            </td>
            <td class="OrderInfoFieldValue" rowspan="3">
                <asp:Label ID="lblAddress1" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblAddress2" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                , <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                &nbsp;
                <asp:Label ID="lblZip" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblCountry" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                Agro Bacterium Strain:&nbsp; 
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblAgroBacteriumStrain" runat="server" Text=""></asp:Label>
            </td>
            <td class="OrderInfoFieldName">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                Plant Selection:&nbsp; 
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblPlantSelection" runat="server" Text=""></asp:Label>
            </td>
            <td class="OrderInfoFieldName">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                &nbsp;</td>
            <td class="OrderInfoFieldValue">
                &nbsp;</td>
            <td class="OrderInfoFieldName">
                Recharge Number:&nbsp; 
            </td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblRechargeNumber" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="OrderInfoFieldName">
                &nbsp;</td>
            <td class="OrderInfoFieldValue">
                &nbsp;</td>
            <td class="OrderInfoFieldName">
                Contract Executed:&nbsp;</td>
            <td class="OrderInfoFieldValue">
                <asp:Label ID="lblContract" runat="server" Text=""></asp:Label>
                <asp:LinkButton ID="lbContractExecuted" runat="server" Visible="false">[Contract Executed]</asp:LinkButton>
            </td>
        </tr>
    </table>
    </asp:Panel>
    
    <br />
    <div style="float:left">
        <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs" >
            <LayoutTemplate>
                <table cellspacing="5px">
                    <tr >
                        <th>Construct Code</th>
                        <th>Date Created</th>
                        <th>Transformation Inititated</th>
                        <th># of Experiments</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                    <tr id="ItemPlaceHolder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("ConstructCode") %></td>
                    <td><%# Eval("DateCreated", "{0:MM/dd/yyyy}")%></td>
                    <td><%# Eval("TransformationInitiated", "{0:MM/dd/yyyy}")%></td>
                    <th><%# Eval("Experiments.Count") %></th>
                    <th><%# Eval("Status.Name") %></th>
                    <td>
                        <asp:Image ID="imgDropDown" runat="server" ImageUrl="~/Images/dropdowntrigger.png" />
                        <AjaxControlToolkit:DropDownExtender ID="ddeDropDown" runat="server" TargetControlID="imgDropDown" DropDownControlID="pnlDropDown">
                        </AjaxControlToolkit:DropDownExtender>
                        <asp:Panel ID="pnlDropDown" runat="server" BackColor='Silver' BorderColor=Black BorderStyle="Solid" BorderWidth="1px">
                                <asp:LinkButton ID="lbViewDetails" runat="server">Details</asp:LinkButton>
                            <br />
                                <asp:LinkButton ID="lbHoldPendingContract" runat="server" Visible='<%# Eval("Status") != null && Eval("Status.Name").ToString() == CAESDO.PTF.BLL.StatusText.STR_Pending %>' 
                                    oncommand="lbHoldPendingContract_Command" CommandArgument='<%# Eval("ID") %>' >Hold Pending Contract</asp:LinkButton>
                                <asp:LinkButton ID="lbSetPending" runat="server" Visible='<%# Eval("Status") != null && Eval("Status.Name").ToString() == CAESDO.PTF.BLL.StatusText.STR_HoldPendingContract  %>' 
                                    oncommand="lbSetPending_Command" CommandArgument='<%# Eval("ID") %>'>Set Pending</asp:LinkButton>
                            
                        </asp:Panel>
                    </td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
                There are no constructs available for this order.
            </EmptyDataTemplate>
        </asp:ListView>
        
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvConstructs" PageSize="20">
            <Fields>
                <asp:NumericPagerField ButtonCount="10" NextPageText="..." PreviousPageText="..." />
                <asp:NextPreviousPagerField FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
            </Fields>
        </asp:DataPager>
    </div>
    <asp:ObjectDataSource ID="odsConstructs" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.ConstructBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="DateCreated" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="false" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsConstructsByOrder" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByOrder" 
        TypeName="CAESDO.PTF.BLL.ConstructBLL">
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderID" QueryStringField="OID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>


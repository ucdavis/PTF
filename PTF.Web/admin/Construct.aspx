<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Construct.aspx.cs" Inherits="admin_Construct" Title="PTF | Constructs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .OrderInfoFieldName
        {
            text-align: right;
            width: 150px;
            float: left;
        }
        .OrderInfoFieldValue
        {
            text-align: left;
            width: 275px;
            float: left;
        }
        .OrderIntoColumns
        {
            width: 425px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Panel ID="pnlOrderDetails" runat="server" Visible="false">

        <div class="OrderIntoColumns">
            <span class="OrderInfoFieldName">
                Order ID:&nbsp;&nbsp;
            </span> 
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
            </span>
            <span class="OrderInfoFieldName">
                PI:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblPI" runat="server" Text=""></asp:Label>
            </span>
            <br />
            <span class="OrderInfoFieldName">
                Bacterial Selection:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblBacterialSelection" runat="server" Text=""></asp:Label>
            </span>
            <span class="OrderInfoFieldName">
                Agro Bacterium Strain:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblAgroBacteriumStrain" runat="server" Text=""></asp:Label>
            </span>
            <span class="OrderInfoFieldName">
                Plant Selection:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblPlantSelection" runat="server" Text=""></asp:Label>
            </span>
        </div>
        
        <div class="OrderIntoColumns">
            <span class="OrderInfoFieldName">
                Contact:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblContact" runat="server" Text=""></asp:Label>
                ( <asp:Label ID="lblContactEmail" runat="server" Text=""></asp:Label> )
            </span>
            <span class="OrderInfoFieldName">
                Contact Phone:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblContactPhone" runat="server" Text=""></asp:Label>
            </span>
            <br />
            <span class="OrderInfoFieldName">
                Address:&nbsp;&nbsp;
            </span>     
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblAddress1" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblAddress2" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                , <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                &nbsp;
                <asp:Label ID="lblZip" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblCountry" runat="server" Text=""></asp:Label>
            </span>
            <span class="OrderInfoFieldName">
                Recharge Number:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblRechargeNumber" runat="server" Text=""></asp:Label>
            </span>
            <span class="OrderInfoFieldName">
                Contract Executed:&nbsp;&nbsp;
            </span>
            <span class="OrderInfoFieldValue">
                <asp:Label ID="lblContract" runat="server" Text=""></asp:Label>
                <asp:LinkButton ID="lbContractExecuted" runat="server" Visible="false">[Contract Executed]</asp:LinkButton>
            </span>
        </div>
    </asp:Panel>
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <asp:ListView ID="lvConstructs" runat="server" DataSourceID="odsConstructs" >
        <LayoutTemplate>
            <table cellspacing="5px">
                <tr >
                    <th>Construct Code</th>
                    <th>Date Created</th>
                    <th>Transformation Inititated</th>
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
                <th><%# Eval("Status.Name") %></th>
                <td>
                    <asp:Image ID="imgDropDown" runat="server" ImageUrl="~/Images/dropdowntrigger.png" />
                    <AjaxControlToolkit:DropDownExtender ID="ddeDropDown" runat="server" TargetControlID="imgDropDown" DropDownControlID="pnlDropDown">
                    </AjaxControlToolkit:DropDownExtender>
                    <asp:Panel ID="pnlDropDown" runat="server" BackColor='Silver' BorderColor=Black BorderStyle="Solid" BorderWidth="1px">
                            <asp:LinkButton ID="lbViewDetails" runat="server">Details</asp:LinkButton>
                        <br />
                            <asp:LinkButton ID="lbHoldPendingContract" runat="server" Visible='<%# Eval("Status.Name").ToString() == CAESDO.PTF.BLL.StatusText.STR_Pending %>' 
                                oncommand="lbHoldPendingContract_Command" CommandArgument='<%# Eval("ID") %>' >Hold Pending Contract</asp:LinkButton>
                            <asp:LinkButton ID="lbSetPending" runat="server" Visible='<%# Eval("Status.Name").ToString() == CAESDO.PTF.BLL.StatusText.STR_HoldPendingContract %>' 
                                oncommand="lbSetPending_Command" CommandArgument='<%# Eval("ID") %>'>Set Pending</asp:LinkButton>
                        
                    </asp:Panel>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            There are no constructs available for this order.
        </EmptyDataTemplate>
    </asp:ListView>
    
        
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


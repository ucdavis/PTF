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
                <asp:Button ID="btnDummy" runat="server" Text="Create Construct" /></td>
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
                <table cellspacing="10px">
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
                    <td><a href='<%# "Experiments.aspx?cid=" + Eval("ID") %>'><%# Eval("ConstructCode") %></a></td>
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
    
        
    
    <AjaxControlToolkit:ModalPopupExtender ID="NewConstruct_ModalPopupExtender" 
        runat="server" DynamicServicePath="" Enabled="True" TargetControlID="btnDummy" PopupControlID="pnlCreateConstruct" 
        CancelControlID="btnCancelCreate">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:Panel ID="pnlCreateConstruct" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="575px" style="display:none;" BackColor="OldLace">
        <asp:Button runat='server' ID="btnCancelCreate" Text="X" style="float:right;" />
        
            Plants Requested: <asp:TextBox ID="tbPlantsRequested" runat="server"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="rfvPlantsRequested" ControlToValidate="tbPlantsRequested" ValidationGroup="CreateConstruct" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>      
        <asp:RegularExpressionValidator ID="revPlantsRequested" runat="server" 
            ControlToValidate="tbPlantsRequested" ErrorMessage="Not a number." ValidationExpression="\d*" 
            ValidationGroup="CreateConstruct"></asp:RegularExpressionValidator>
        <br />
            PI Construct Name: <asp:TextBox ID="tbPIConstructName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPIConstructName" ValidationGroup="CreateConstruct" ControlToValidate="tbPIConstructName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
            PI Code: <asp:TextBox ID="tbPICode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPICode" runat="server" ErrorMessage="*" ValidationGroup="CreateConstruct" ControlToValidate="tbPICode"></asp:RequiredFieldValidator>
        <br />
            Agro Strain: 
                <asp:DropDownList ID="ddlAgroStrain" runat="server" 
                DataSourceID="odsAgroStrain" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                    <asp:ListItem Text="--Select Agro Strain--" Value="-1" />
                </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvAgroStrain" runat="server" ErrorMessage="*" 
            ControlToValidate="ddlAgroStrain" InitialValue="-1" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <br />
            Bacterial Selection: <asp:TextBox ID="tbBacterialSelection" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvBacterialSelection" runat="server" 
            ControlToValidate="tbBacterialSelection" ErrorMessage="*" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
            Plasmid: <asp:TextBox ID="tbPlasmid" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPlasmid" runat="server" 
            ControlToValidate="tbPlasmid" ErrorMessage="*" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <br />
            Trait: <asp:TextBox ID="tbTrait" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTrait" runat="server" 
            ControlToValidate="tbTrait" ErrorMessage="*" ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
            Gene of Interest: <asp:TextBox ID="tbGeneofInterest" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTraitOfInterest" runat="server" 
            ControlToValidate="tbGeneofInterest" ErrorMessage="*" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <br />
            Selectable Marker: 
                <asp:DropDownList ID="ddlSelectableMarker" runat="server" 
                    DataSourceID="odsSelectableMarker" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                    <asp:ListItem Text="--Select Selectable Marker--" Value="-1" />
                </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvSelectableMarker" runat="server" 
            ControlToValidate="ddlSelectableMarker" ErrorMessage="*" InitialValue="-1" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <br />
        Crop: 
            <asp:DropDownList ID="ddlCrop" runat="server" DataSourceID="odsCrop" 
                DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                <asp:ListItem Text="--Select Crop--" Value="-1" />
            </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvCrop" runat="server" 
            ControlToValidate="ddlCrop" ErrorMessage="*" InitialValue="-1" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Genotype: 
            <asp:DropDownList ID="ddlGenotype" runat="server" 
                DataSourceID="odsGenotype" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                <asp:ListItem Text="--Select Genotype--" Value="-1" />
            </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvGenotype" runat="server" 
            ControlToValidate="ddlGenotype" ErrorMessage="*" InitialValue="-1" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <br />
            Date Received: 
                <asp:TextBox ID="tbDateReceived" runat="server" Width="70px"></asp:TextBox>
                <asp:Image ID="imgDateReceived" runat="server" ImageUrl="~/Images/calendar.png" />
                <AjaxControlToolkit:CalendarExtender ID="ceDateReceived" runat="server" 
                    TargetControlID="tbDateReceived" PopupButtonID="imgDateReceived" >
                </AjaxControlToolkit:CalendarExtender>
        &nbsp;<asp:RequiredFieldValidator ID="rfvDateReceived" runat="server" ControlToValidate="tbDateReceived" ErrorMessage="*" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revDateReceived" ControlToValidate="tbDateReceived" runat="server" 
            ValidationGroup="CreateConstruct" ValidationExpression="^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$"
            ErrorMessage="*"></asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp; Recharge Amount:&nbsp; $<asp:TextBox ID="tbRechargeAmount" runat="server" 
            Height="22px" Width="73px"></asp:TextBox>
        <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbRechargeAmount_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="tbRechargeAmount" WatermarkCssClass="watermark" WatermarkText="00.00">
        </AjaxControlToolkit:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="rfvRechargeAmount" runat="server" 
            ControlToValidate="tbRechargeAmount" ErrorMessage="*" 
            ValidationGroup="CreateConstruct"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revRechargeAmount" runat="server" 
            ErrorMessage="Not correct format." ValidationExpression="\d*(.\d{2})?" 
            ValidationGroup="CreateConstruct" ControlToValidate="tbRechargeAmount"></asp:RegularExpressionValidator>
        <br />
            Comment: <asp:TextBox ID="tbComment" runat="server" TextMode="MultiLine" 
            Height="89px" Width="396px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
            Text="Create" ValidationGroup="CreateConstruct" />
    </asp:Panel>
    <asp:ObjectDataSource ID="odsSelectableMarker" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.SelectableMarkerBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAgroStrain" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.AgroStrainBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCrop" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CropBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGenotype" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.GenoTypeBLL"></asp:ObjectDataSource>
</asp:Content>


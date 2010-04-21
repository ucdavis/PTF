<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        function CreateConstruct(orderID)
        {
            // need to reset all the controls inside the modal
        
            $get('<%= tbOrderID.ClientID %>').value = orderID;
            $find('<%= NewConstruct_ModalPopupExtender.ClientID %>').show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders">
        <LayoutTemplate>
            <table cellpadding="5px">
                <tr>
                    <th></th>
                    <th>Order ID</th>
                    <th>PI</th>
                    <th>Contact Name</th>
                    <th>Contact E-mail</th>
                    <th>Date Requested</th>
                    <th># Constructs</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbSelect" runat="server">Select</asp:LinkButton>
                </td>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("Constructs.Count") %></td>
                <td><%# Eval("Status") %></td>
                <td>
                    <asp:Image ID="imgDropDown" runat="server" ImageUrl="~/Images/dropdowntrigger.png" />
                    <AjaxControlToolkit:DropDownExtender ID="ddeDropDown" runat="server" TargetControlID="imgDropDown" DropDownControlID="pnlDropDown">
                    </AjaxControlToolkit:DropDownExtender>
                    <asp:Panel ID="pnlDropDown" runat="server" style="background:gray">
                        <asp:LinkButton ID="lbCreateConstruct" runat="server" OnClientClick='<%# "CreateConstruct(" + Eval("ID") + "); return false;" %>' >
                            Create Construct
                        </asp:LinkButton>
                    </asp:Panel>
                </td>
            </tr>
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
    
    <asp:Button ID="btnDummy" runat="server" Text="Button" style="display:none;" />
    
    <AjaxControlToolkit:ModalPopupExtender ID="NewConstruct_ModalPopupExtender" 
        runat="server" DynamicServicePath="" Enabled="True" TargetControlID="btnDummy" PopupControlID="pnlCreateConstruct" 
        CancelControlID="btnCancelCreate">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:Panel ID="pnlCreateConstruct" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="575px" style="display:none;">
        <asp:TextBox ID="tbOrderID" style="display:none;" runat="server"></asp:TextBox>
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


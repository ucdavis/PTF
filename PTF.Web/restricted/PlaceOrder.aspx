<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="restricted_PlaceOrder" Title="PTF | Place Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            background-color: #0066CC;
        }
        .style3
        {
            width: 349px;
        }
        .addressFields
        {
            width: 180px;
            float: left;
        }
    </style>
    
    <script type="text/javascript" src="../JS/PlaceOrder.js" ></script>
    <script type="text/javascript">
          
        function onCountryChange(ddl)
        {      
            var index = ddl.selectedIndex;
            var value = ddl.options[index].value;
            
            var ctrl = ddl.id;
            
            // handle a change in the mailing address
            if (ctrl.toLowerCase().indexOf("mailing") > 0)
            {       
                ChangeCountry(value, $get("<%= ddlMailingState.ClientID %>"), $get("<%= tbMailingState.ClientID %>"));
            }
            // handle a change in the shipping address
            else if (ctrl.toLowerCase().indexOf("shipping") > 0)
            {
                ChangeCountry(value, $get("<%= ddlShippingState.ClientID %>"), $get("<%= tbShippingState.ClientID %>"));
            }
            else
            {
                // do nothing
            }
        }
       function ChangeCountry (countryCode, stateDropDown, internationalStateBox)
        {
            if (countryCode == "USA")
            {
                stateDropDown.style.display = "inline";
                stateDropDown.disabled = false;
                internationalStateBox.style.display = "none";
            }
            else if (countryCode == "-1")
            {
                stateDropDown.style.display = "inline";
                stateDropDown.disabled = true;
                internationalStateBox.style.display = "none";        
            }
            else
            {
                stateDropDown.style.display = "none";
                internationalStateBox.style.display = "inline";    
            }
        }
        function onShippingAddressSame(checkBox)
        {
            if (checkBox.checked)
            {
                $get("<%= tbShipping1.ClientID %>").disabled = true;
                $get("<%= tbShipping2.ClientID %>").disabled = true;
                $get("<%= tbShippingCity.ClientID %>").disabled = true;
                $get("<%= tbShippingState.ClientID %>").disabled = true;
                $get("<%= ddlShippingState.ClientID %>").disabled = true;
                $get("<%= tbShippingZip.ClientID %>").disabled = true;
                $get("<%= ddlShippingCountry.ClientID %>").disabled = true;
            }
            else
            {
                $get("<%= tbShipping1.ClientID %>").disabled = false;
                $get("<%= tbShipping2.ClientID %>").disabled = false;
                $get("<%= tbShippingCity.ClientID %>").disabled = false;
                $get("<%= tbShippingZip.ClientID %>").disabled = false;
                $get("<%= ddlShippingCountry.ClientID %>").disabled = false;
                
                var ddl = $get("<%= ddlShippingCountry.ClientID %>");
                var index = ddl.selectedIndex;
                var value = ddl.options[index].value;
                
                if (value == "USA")
                {
                    $get("<%= ddlShippingState.ClientID %>").style.display = "inline";
                    $get("<%= ddlShippingState.ClientID %>").disabled = false;
                    $get("<%= tbShippingState.ClientID %>").style.display = "none";
                }
                else if (value == "-1")
                {
                    $get("<%= ddlShippingState.ClientID %>").style.display = "inline";
                    $get("<%= ddlShippingState.ClientID %>").disabled = true;
                    $get("<%= tbShippingState.ClientID %>").style.display = "none";      
                }
                else
                {
                    $get("<%= ddlShippingState.ClientID %>").style.display = "none";
                    $get("<%= tbShippingState.ClientID %>").style.display = "inline";
                    $get("<%= tbShippingState.ClientID %>").disabled = false;      
                }
            }
        }
        
        function ValidateStates()
        {       
            debugger;
           
            // validate the page?
        
            var mailingFlag = false;
            var shippingFlag = false;
        
            var mailingStateDDL = $get("<%= ddlMailingState.ClientID %>");
            var mailingStateTB = $get("<%= tbMailingState.ClientID %>");
            var mailingCountryDDL = $get("<%= ddlMailingCountry.ClientID %>");
            
            // first check to see if the mailing country is still at -1
            if (mailingCountryDDL.options[mailingCountryDDL.selectedIndex].value == "-1")
            {
                // no way a state can be selected
            }
            else if (mailingCountryDDL.options[mailingCountryDDL.selectedIndex].value == "USA")
            {
                // drop down state needs to have something selected
                if (mailingStateDDL.options[mailingStateDDL.selectedIndex].value != "-1")
                {
                    // we are good on the mailing address
                    mailingFlag = true;
                }
            }
            else
            {
                // international state is necessary
                if (mailingStateTB.value != "")
                {
                    mailingFlag = true;
                }
            }
        
            // check the shipping info
            
            var shippingStateDDL = $get("<%= ddlShippingState.ClientID %>");
            var shippingStateTB = $get("<%= tbShippingState.ClientID %>");
            var shippingCountryDDL = $get("<%= ddlShippingCountry.ClientID %>");
            
            alert("HI");
        
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table class="style1">
        <tr>
            <td class="style3">
                Principal Investigator: </td>
            <td>
                <asp:TextBox ID="tbPI" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPI" runat="server" ErrorMessage="PI name is required." Text="*" ControlToValidate="tbPI" ValidationGroup="NewOrder" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Mailing Address:</td>
            <td>
                Address Line 1<br />
                <asp:TextBox ID="tbMailing1" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbMailing1_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbMailing1" WatermarkText="Street Address, P.O. Box, Comapny Name" WatermarkCssClass="watermark">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="rfvMailing1" runat="server" Text="*" ControlToValidate="tbMailing1" ValidationGroup="NewOrder" 
                    ErrorMessage="Address Line 1 is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Address Line 2<br />
                <asp:TextBox ID="tbMailing2" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbMailing2_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbMailing2" WatermarkText="Apartment, Suite, Unit, Building, Floor, etc." WatermarkCssClass="watermark">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <div class="addressFields">
                City<br />
                <asp:TextBox ID="tbMailingCity" runat="server" Width="160px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMailingCity" runat="server" Text="*" ControlToValidate="tbMailingCity" ValidationGroup="NewOrder"
                        ErrorMessage="Mailing City is required."></asp:RequiredFieldValidator>
                </div>
                <div class="addressFields">
                    State/Province/Region<br />
                    <asp:TextBox ID="tbMailingState" runat="server" style="display:none;" Width="160px" MaxLength="50" ></asp:TextBox>  
                    <asp:DropDownList ID="ddlMailingState" runat="server" DataSourceID="odsState" DataTextField="Name" DataValueField="ID" Width="160px" AppendDataBoundItems="true" Enabled=false>
                        <asp:ListItem Text="--Select a State--" Value="-1" />
                    </asp:DropDownList>
                    <div id="MailingStateWarning" style="color:Red; display:none;">*</div>
                </div>
                <div class="addressFields">
                Zip/Postal Code<br />
                <asp:TextBox ID="tbMailingZip" runat="server" Width="160px" MaxLength="12"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMailingZip" runat="server" Text="*" ControlToValidate="tbMailingZip" ValidationGroup="NewOrder" 
                        ErrorMessage="Mailing ZIP is required."></asp:RequiredFieldValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Country: 
                <asp:DropDownList ID="ddlMailingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID"  
                    AppendDataBoundItems="True" onChange="javascript:onCountryChange(this);"  >
                    <asp:ListItem Text="--Select a Country--" Value="-1" />
                </asp:DropDownList>                    
                <asp:RequiredFieldValidator ID="rfvMailingCountry" runat="server"  Text="*" ControlToValidate="ddlMailingCountry" ValidationGroup="NewOrder" InitialValue="-1"
                    ErrorMessage="Mailing Country is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Shipping Address:</td>
            <td>
                <asp:CheckBox ID="cbShippingSame" Text="Shipping Address is the same as mailing." runat="server" onClick="onShippingAddressSame(this)" />

            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Address Line 1 <br />
                <asp:TextBox ID="tbShipping1" runat="server" Width="300px" MaxLength="100"></asp:TextBox>                
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbShipping1_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbShipping1" WatermarkText="Street Address, P.O. Box, Comapny Name" WatermarkCssClass="watermark">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Address Line 2 <br />
                <asp:TextBox ID="tbShipping2" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbShipping2_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbShipping2" WatermarkText="Apartment, Suite, Unit, Building, Floor, etc." WatermarkCssClass="watermark">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <div class="addressFields">
                    City<br />
                    <asp:TextBox ID="tbShippingCity" runat="server" Width="160px" MaxLength="50"></asp:TextBox>
                </div>
                <div class="addressFields">
                State/Province/Region<br />
                        <asp:TextBox ID="tbShippingState" runat="server" style="display:none;" Width="160px" MaxLength="50"></asp:TextBox>
                        <asp:DropDownList ID="ddlShippingState" runat="server" DataSourceID="odsState" Width="160px" 
                            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True" Enabled=false>
                            <asp:ListItem Text="--Select a State--" Value="-1" />
                         </asp:DropDownList>
                </div>
                <div class="addressFields">
                    Zip/Postal Code<br />
                    <asp:TextBox ID="tbShippingZip" runat="server" Width="160px" MaxLength="12"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Country: 
                <asp:DropDownList ID="ddlShippingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID" 
                    onChange="onCountryChange(this);" AppendDataBoundItems=true >
                    <asp:ListItem Text="--Select a Country--" Value="-1" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact:</td>
            <td>
                <asp:TextBox ID="tbContact" runat="server" MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact E-mail:</td>
            <td>
                <asp:TextBox ID="tbContactEmail" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="tbContactEmail" ErrorMessage="E-mail is required." ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="tbContactEmail" Text="*" ErrorMessage="E-mail is not in the correct format." ValidationGroup="NewOrder" ValidationExpression="^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.(af|ax|al|dz|as|ad|ao|ai|aq|ag|ar|am|aw|au|at|az|bs|bh|bd|bb|by|be|bz|bj|bm|bt|bo|ba|bw|bv|br|io|bn|bg|bf|bi|kh|cm|ca|cv|ky|cf|td|cl|cn|cx|cc|co|km|cg|cd|ck|cr|ci|hr|cu|cy|cz|dk|dj|dm|do|ec|eg|sv|gq|er|ee|et|fk|fo|fj|fi|fr|gf|pf|tf|ga|gm|ge|de|gh|gi|gr|gl|gd|gp|gu|gt| gg|gn|gw|gy|ht|hm|va|hn|hk|hu|is|in|id|ir|iq|ie|im|il|it|jm|jp|je|jo|kz|ke|ki|kp|kr|kw|kg|la|lv|lb|ls|lr|ly|li|lt|lu|mo|mk|mg|mw|my|mv|ml|mt|mh|mq|mr|mu|yt|mx|fm|md|mc|mn|ms|ma|mz|mm|na|nr|np|nl|an|nc|nz|ni|ne|ng|nu|nf|mp|no|om|pk|pw|ps|pa|pg|py|pe|ph|pn|pl|pt|pr|qa|re|ro|ru|rw|sh|kn|lc|pm|vc|ws|sm|st|sa|sn|cs|sc|sl|sg|sk|si|sb|so|za|gs|es|lk|sd|sr|sj|sz|se|ch|sy|tw|tj|tz|th|tl|tg|tk|to|tt|tn|tr|tm|tc|tv|ug|ua|ae|gb|us|um|uy|uz|vu|ve|vn|vg|vi|wf|eh|ye|zm|zw|com|edu|gov|int|mil|net|org|biz|info|name|pro|aero|coop|museum|arpa))|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact Phone:</td>
            <td>
                <asp:TextBox ID="tbContactPhone" runat="server" MaxLength="20"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Recharge Number:</td>
            <td>
                <asp:TextBox ID="tbRecharge" runat="server" MaxLength="20"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Plant Information</strong>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Crop:</td>
            <td>
                <asp:DropDownList ID="ddlCrop" runat="server" DataSourceID="odsCrop" 
                    DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                        <asp:ListItem Text="--Select a Crop--" Value="-1" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCrop" runat="server" 
                    ErrorMessage="You are required to select a crop." 
                    ControlToValidate="ddlCrop" InitialValue="-1" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Cultivar:</td>
            <td>
                <asp:TextBox ID="tbCultivar" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCultivar" runat="server" Text="*" ControlToValidate="tbCultivar" ValidationGroup="NewOrder"
                    ErrorMessage="Cultivar is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Number of Plants:</td>
            <td>
                <asp:TextBox ID="tbNumberofPlants" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbNumberofPlants" ErrorMessage="Number of Plants is not a number." Text="*" ValidationExpression="\d*"
                    ValidationGroup="NewOrder">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                Molecular Information</td>
        </tr>
        <tr>
            <td class="style3">
                Plasmid:</td>
            <td>
                <asp:TextBox ID="tbPlasmid" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPlasmid" runat="server" Text="*" ControlToValidate="tbPlasmid" ValidationGroup="NewOrder"
                    ErrorMessage="Plasmid is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bacterial Selection:</td>
            <td>
                <asp:TextBox ID="tbBacterialSelection" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBacterialSelection" runat="server" ControlToValidate="tbBacterialSelection"
                    ErrorMessage="Bacterial Selection is required." Text="*" ValidationGroup="NewOrder">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Agrobacterium Strain:</td>
            <td>
                <asp:TextBox ID="tbAgrobacteriumStrain" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAgrobacteriumStrain" runat="server" ControlToValidate="tbAgrobacteriumStrain"
                    ErrorMessage="Agrobacterium Strain is required." Text="*" ValidationGroup="NewOrder"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Plant Selection:</td>
            <td>
                <asp:TextBox ID="tbPlantSelection" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPlantSelection" runat="server" ControlToValidate="tbPlantSelection"
                    ErrorMessage="Plant Selection is required." Text="*" ValidationGroup="NewOrder"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Construct:</td>
            <td>
                <asp:TextBox ID="tbConstruct" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConstruct" runat="server" Text="*" ValidationGroup="NewOrder" ControlToValidate="tbConstruct" 
                    ErrorMessage="Construct is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Name of Your Construct:</td>
            <td>
                <asp:TextBox ID="tbNameOfYourConstruct" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvYourconstruct" runat="server" Text="*" ControlToValidate="tbNameOfYourConstruct" ValidationGroup="NewOrder"
                    ErrorMessage="Name of your construct is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Detailed Construct Description</strong>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Category of Transgene:</td>
            <td>
                <asp:DropDownList ID="ddlTransGene" runat="server" DataSourceID="odsTransGene" 
                    DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                        <asp:ListItem Text="--Select Transgene--" Value="-1" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Construct: Gene of Interest</strong>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Promoter:</td>
            <td>
                <asp:TextBox ID="tbGeneOfInterestPromoter" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbGeneOfInterestGene" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbGeneOfInterestTerminator" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Construct: Selectable Marker</strong></td>
        </tr>
        <tr>
            <td class="style3">
                Promoter:</td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerPromoter" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSelectableMarkerPromoter" runat="server" 
                    ErrorMessage="Selectable Marker Promoter is required." 
                    ControlToValidate="tbSelectableMarkerPromoter" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerGene" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSelectableMarkerGene" runat="server" 
                    ErrorMessage="Selectable Marker Gene is required." 
                    ControlToValidate="tbSelectableMarkerGene" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerTerminator" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Construct: Scorable Marker (if applicable)</strong></td>
        </tr>
        <tr>
            <td class="style3">
                Promoter:</td>
            <td>
                <asp:TextBox ID="tbScorableMarkerPromoter" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbScorableMarkerGene" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbScorableMarkerTerminator" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Additonal Information</strong></td>
        </tr>
        <tr>
            <td class="style3">
                Please include any additional information here:</td>
            <td>
                <asp:TextBox ID="tbAdditionalInfo" runat="server" TextMode="MultiLine" 
                    Height="138px" Width="408px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <strong>Use of Biomaterials</strong></td>
        </tr>
        <tr>
            <td class="style3">
                    Can The Ralph M. Parsons Foundation Plant Transformation Facility maintain an 
                    archived stock of the <i>Agrobacterium</i> culture you are sending us for use by 
                    other Univeristy of California researchers?
            </td>
            <td>
                <asp:RadioButtonList ID="rblOtherUse" runat="server">
                    <asp:ListItem Text="Yes" Value="True" />
                    <asp:ListItem Text="No" Value="False" />
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvOtherUse" runat="server" 
                    ErrorMessage="Archive disclaimer is required." ControlToValidate="rblOtherUse" 
                    ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ValidationGroup="NewOrder" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Submit Order" 
                    ValidationGroup="NewOrder" OnClientClick="return ValidateStates();" onclick="btnPlaceOrder_Click" />
            </td>
        </tr>
    </table>

    <br />
    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CountryBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCrop" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CropBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsTransGene" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.TransGeneBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsState" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.StateBLL"></asp:ObjectDataSource>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="restricted_PlaceOrder" Title="PTF | Place Order" EnableEventValidation="false" %>

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
    
    <script type="text/javascript" src="../JS/AddressScripts.js"></script>
    
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

        function onShippingAddressSame(checkBox)
        {
            var mailing1 = $get("<%= tbMailing1.ClientID %>");
            var mailing2 = $get("<%= tbMailing2.ClientID %>");
            var mailingCity = $get("<%= tbMailingCity.ClientID %>");
            var mailingStateDDL = $get("<%= ddlMailingState.ClientID %>");
            var mailingStateTB = $get("<%= tbMailingState.ClientID %>");
            var mailingZip = $get("<%= tbMailingZip.ClientID %>");
            var mailingCountry = $get("<%= ddlMailingCountry.ClientID %>");
            
            var shipping1 = $get("<%= tbShipping1.ClientID %>");
            var shipping2 = $get("<%= tbShipping2.ClientID %>");
            var shippingCity = $get("<%= tbShippingCity.ClientID %>");
            var shippingStateTB = $get("<%= tbShippingState.ClientID %>");
            var shippingStateDDL = $get("<%= ddlShippingState.ClientID %>");
            var shippingZip = $get("<%= tbShippingZip.ClientID %>");
            var shippingCountry = $get("<%= ddlShippingCountry.ClientID %>");
            
            ShippingAddressSame(checkBox, mailing1, mailing2, mailingCity, mailingStateDDL, mailingStateTB, mailingZip, mailingCountry, shipping1, shipping2, shippingCity, shippingStateTB, shippingStateDDL, shippingZip, shippingCountry);
        }
        
        function ValidateStates()
        {       
            var warningString = str_empty;               
        
            Page_ClientValidate();  // validate the other controls
            
            // validate the mailing state to see if either the ddl or the tb was filled properly
            if (!ValidateMailing())
            {
                warningString += "<li>Mailing State is required.</li>";
                $get("MailingStateWarning").style.display = str_inline;
            }
            else
            {
                $get("MailingStateWarning").style.display = str_none;
            }
            
            var shippingFields = ValidateShipping();

            $get("ShippingAddressWarning").style.display = str_none;
            $get("ShippingCityWarning").style.display = str_none;
            $get("ShippingStateWarning").style.display = str_none;
            $get("ShippingZipWarning").style.display = str_none;
            $get("ShippingCountryWarning").style.display = str_none;
            
            if (shippingFields.length > 0)
            {
                for (i=0; i < shippingFields.length; i++)
                {
                    switch(shippingFields[i])
                    {
                        case str_address1:  warningString += "<li>Shipping Address 1 is required.</li>";
                                            $get("ShippingAddressWarning").style.display = str_inline;
                                            break;
                        case str_city:      warningString += "<li>Shipping City is required.</li>";
                                            $get("ShippingCityWarning").style.display = str_inline;
                                            break;
                        case str_state:     warningString += "<li>Shipping State is required.</li>";
                                            $get("ShippingStateWarning").style.display = str_inline;
                                            break;
                        case str_zip:       warningString += "<li>Shipping ZIP is required.</li>";
                                            $get("ShippingZipWarning").style.display = str_inline;
                                            break;
                        case str_country:   warningString += "<li>Shipping country is required.</li>";
                                            $get("ShippingCountryWarning").style.display = str_inline;
                                            break;
                        default:            break;
                    }
                }
            }
       
            // validate the suborders        
            if (!ValidateSubOrders()) // false means it failed validation
            {
                warningString += "<li>At least one Plant Information entry is not complete.</li>";
                $get("PlantInformationValidation").innerHTML = "*";
            }   
            else
            {
                $get("PlantInformationValidation").innerHTML = "";
            }     
        
            if (warningString != str_empty)
            {
                var warningsBox = $get("ValidationWarnings");
                warningsBox.innerHTML = "<ul>" + warningString + "</ul>";
                warningsBox.style.display = str_inline;
                
                return false;
            }
            else
            {
                return true;
            }
        }
        
        function ValidateMailing()
        {
            var mailingStateDDL = $get("<%= ddlMailingState.ClientID %>");
            var mailingStateTB = $get("<%= tbMailingState.ClientID %>");
            var mailingCountryDDL = $get("<%= ddlMailingCountry.ClientID %>");        
            
            return ValidateCountryState(mailingCountryDDL, mailingStateDDL, mailingStateTB);
        }
        
        function ValidateShipping()
        {
            var shippingStateDDL = $get("<%= ddlShippingState.ClientID %>");
            var shippingStateTB = $get("<%= tbShippingState.ClientID %>");
            var shippingCountryDDL = $get("<%= ddlShippingCountry.ClientID %>");
            var sameCB = $get("<%= cbShippingSame.ClientID %>");
            
            var fields = new Array();
            
            if (sameCB.checked)
            {
                // no need to validate the shipping address must be valid
                return fields;
            }
            else
            {
                // validate the other parts of the address
                if ($get("<%= tbShipping1.ClientID %>").value == str_empty)
                {
                    fields.push(str_address1);
                }
                if ($get("<%= tbShippingCity.ClientID %>").value == str_empty)
                {
                    fields.push(str_city);
                }
                if ($get("<%= tbShippingZip.ClientID %>").value == str_empty)
                {
                    fields.push(str_zip);
                }
                              
                if (shippingCountryDDL.options[shippingCountryDDL.selectedIndex].value != str_unselected)
                {
                    if (shippingCountryDDL.options[shippingCountryDDL.selectedIndex].value == str_usa)
                    {
                        if (shippingStateDDL.options[shippingStateDDL.selectedIndex].value == str_unselected)
                        {
                            fields.push(str_state);
                        }
                    }
                    else // international, validate the txt box
                    {
                        if (shippingStateTB.value == str_empty)
                        {
                            fields.push(str_state);
                        }
                    }
                }
                else
                {
                    //country not selected
                    fields.push(str_country);
                    fields.push(str_state);
                }
            }
            
            return fields;
        }
        
        function ValidateSubOrders()
        {
            var placeholder2 = $get("<%= upPlantInformation.ClientID %>");

            var valid = true;           // determines if there is a partially completed plant information section
            var atleastOne = false;     // checks to see that there is atleast one selected
            var counter = 0;
                                  
            // iterate through the list of children to find the controls.
            for (i = 0; i < placeholder2.childNodes.length; i++)
            {
                var obj = placeholder2.childNodes[i];
                
                var plantSelectionDropDown = null;
                var genotypeDropDown = null;
                var cropIncrementDropDown = null;

                // get the crop drop down and make sure it's the select object and not client state information (for cascading drop down)
                if (obj.tagName == "SELECT" && obj.id.match("ddlCrop") != null && obj.id.match("ddlCropIncrement") == null) {
                    counter++; // increment the counter

                    plantSelectionDropDown = obj.nextSibling;
                    genotypeDropDown = plantSelectionDropDown.nextSibling;
                    //numPlantsTxt = genotypeDropDown.nextSibling;
                    cropIncrementDropDown = genotypeDropDown.nextSibling;

                    // check the case that all information is populated
                    if (obj.selectedIndex > 0 && plantSelectionDropDown.selectedIndex > 0 && genotypeDropDown.selectedIndex > 0 && cropIncrementDropDown.selectedIndex > 0) //&& !isNaN(parseInt(numPlantsTxt.value)))
                    {
                        atleastOne = true;
                    }
                    else if (obj.selectedIndex == 0) //&& numPlantsTxt.value == "# of Plants") // nothing was selected
                    {
                        // do nothing
                    }
                    else    // partially completed information
                    {
                        valid = false;
                    }
                }
            }
                                          
            // check to see if there was atleast one selected                       
            if (!atleastOne)
            {
                return false;
            }
            
            // return on the condition that there isn't atleast one that is not valid
            return valid;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" class="noStyle">


    <table class="style1 noStyle orderform">
        <tr>
            <td colspan="2">
            <h1 class="orderform">Client Information </h2>
            <i>* Bold indicates required field</i><br />
            </td>
        </tr>
        <tr>
            <td class="style3" style="width: 400px;"><strong>Principal Investigator:</strong> </td>
            <td style="width: 600px;">
                <asp:TextBox ID="tbPI" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPI" runat="server" ErrorMessage="PI name is required." Text="*" ControlToValidate="tbPI" ValidationGroup="NewOrder" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Mailing Address:</strong></td>
            <td>
                Address Line 1<br />
                <asp:TextBox ID="tbMailing1" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
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
                    <span id="MailingStateWarning" style="color:Red; display:none;">*</span>
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
                Country: <br />
                <asp:DropDownList ID="ddlMailingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID"  
                    AppendDataBoundItems="True" onChange="javascript:onCountryChange(this);"  >
                    <asp:ListItem Text="--Select a Country--" Value="-1" />
                </asp:DropDownList>                    
                <asp:RequiredFieldValidator ID="rfvMailingCountry" runat="server"  Text="*" ControlToValidate="ddlMailingCountry" ValidationGroup="NewOrder" InitialValue="-1"
                    ErrorMessage="Mailing Country is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
            <td class="style3">
                <strong>Shipping Address:</strong></td>
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
                <span id="ShippingAddressWarning" style="color:Red; display:none;">*</span>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Address Line 2 <br />
                <asp:TextBox ID="tbShipping2" runat="server" Width="300px" MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <div class="addressFields">
                    City<br />
                    <asp:TextBox ID="tbShippingCity" runat="server" Width="160px" MaxLength="50"></asp:TextBox>
                    <span id="ShippingCityWarning" style="color:Red; display:none;">*</span>
                </div>
                <div class="addressFields">
                State/Province/Region<br />
                        <asp:TextBox ID="tbShippingState" runat="server" style="display:none;" Width="160px" MaxLength="50"></asp:TextBox>
                        <asp:DropDownList ID="ddlShippingState" runat="server" DataSourceID="odsState" Width="160px" 
                            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True" Enabled=false>
                            <asp:ListItem Text="--Select a State--" Value="-1" />
                         </asp:DropDownList>
                         <span id="ShippingStateWarning" style="color:Red; display:none;">*</span>
                </div>
                <div class="addressFields">
                    Zip/Postal Code<br />
                    <asp:TextBox ID="tbShippingZip" runat="server" Width="160px" MaxLength="12"></asp:TextBox>
                    <span id="ShippingZipWarning" style="color:Red; display:none;">*</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Country: <br />
                <asp:DropDownList ID="ddlShippingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID" 
                    onChange="onCountryChange(this);" AppendDataBoundItems=true >
                    <asp:ListItem Text="--Select a Country--" Value="-1" />
                </asp:DropDownList>
                <span id="ShippingCountryWarning" style="color:Red; display:none;">*</span>
            </td>
        </tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
            <td class="style3">
                <strong>Contact Name:</strong></td>
            <td>
                <asp:TextBox ID="tbContact" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContact" runat="server" Text="*" ValidationGroup="NewOrder" ControlToValidate="tbContact"
                    ErrorMessage="Contact Name is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Contact E-mail:</strong></td>
            <td>
                <asp:TextBox ID="tbContactEmail" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="tbContactEmail" ErrorMessage="E-mail is required." ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="tbContactEmail" Text="*" ErrorMessage="E-mail is not in the correct format." ValidationGroup="NewOrder" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Contact Phone:</strong></td>
            <td>
                <asp:TextBox ID="tbContactPhone" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" Text="*" ValidationGroup="NewOrder" ControlToValidate="tbContactPhone"
                    ErrorMessage="Contact Phone number is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Recharge Number:</strong></td>
            <td>
                <asp:TextBox ID="tbRecharge" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRecharge" runat="server" 
                    ErrorMessage="Recharge number is required." 
                    ControlToValidate="tbSelectableMarkerGene" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
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
                <h1 class="orderform">Plant Information <span style="color: Red;" id="PlantInformationValidation"></span></h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">  
                  
               <i>* If you select the "Other" option for genotype or plant selection someone from the PTF will be calling you to discuss your order.</i>
               <br />
               <i>** If you wish to place another transformation order for this same construct in another crop or genotype, use the plus button to provide more space to do so.</i>
                <br /><br />
                <span class="btnPrices">
                <a href="http://169.237.124.53/PTF/services#transformation-services-pricing-schedule" target="_blank"><img src="../Images/btn_prices.png" alt="Transformation prices" /></a>
                <%--<asp:ImageButton runat="server" ID="btnPrices" PostBackUrl="http://169.237.124.53/PTF/services" ImageUrl="~/Images/btn_prices.png" Target="_blank" />--%>
                </span>
          
                
                <asp:UpdatePanel ID="upPlantInformation" runat="server">
                    <ContentTemplate>
                        <asp:PlaceHolder ID="phPlantInformation" runat="server">
                        </asp:PlaceHolder>
                        <asp:LinkButton ID="lbAddPlantInformationFields" runat="server" 
                                style="text-decoration:none;" onclick="lbAddPlantInformationFields_Click" ToolTip="Click here to place another transformation order for this SAME construct in another crop or genotype.">
                            <img src="../Images/add.png" style="height:16px; width:16px; border:none;" />
                        </asp:LinkButton>
                    </ContentTemplate>
                </asp:UpdatePanel>    
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
                <h1 class="orderform">Molecular Information</h1></td>
        </tr>
        <tr>
            <td class="style3">
                Plasmid:</td>
            <td>
                <asp:TextBox ID="tbPlasmid" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Bacterial Selection:</strong></td>
            <td>
                <asp:TextBox ID="tbBacterialSelection" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBacterialSelection" runat="server" ControlToValidate="tbBacterialSelection"
                    ErrorMessage="Bacterial Selection is required." Text="*" ValidationGroup="NewOrder">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Agrobacterium Strain:</strong></td>
            <td>
                <asp:DropDownList ID="ddlAgroStrain" runat="server" AppendDataBoundItems=True 
                    DataSourceID="odsAgroStrain" DataTextField="Name" DataValueField="ID">
                    <asp:ListItem Value="-1" Text="--Select Agro Strain--"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAgrobacteriumStrain" runat="server" ControlToValidate="ddlAgroStrain" InitialValue="-1"
                    ErrorMessage="Agrobacterium Strain is required." Text="*" ValidationGroup="NewOrder"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Construct Code:</td>
            <td>
                <asp:TextBox ID="tbConstruct" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Name of Your Construct:</strong></td>
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
                <h2>Detailed Construct Description</h2>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Category of Transgene:</strong></td>
            <td>
                <asp:DropDownList ID="ddlTransGene" runat="server" DataSourceID="odsTransGene" 
                    DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                        <asp:ListItem Text="--Select Transgene--" Value="-1" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTransGene" runat="server" InitialValue="-1" ErrorMessage="Transgene is required." Text="*" ControlToValidate="ddlTransGene" ValidationGroup="NewOrder"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style3">
                Trait:
            </td>
            <td>
                <asp:TextBox ID="tbTrait" runat="server" MaxLength="50"></asp:TextBox>
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
                <h2>Construct: Selectable Marker</h2></td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Promoter:</strong></td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerPromoter" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSelectableMarkerPromoter" runat="server" 
                    ErrorMessage="Selectable Marker Promoter is required." 
                    ControlToValidate="tbSelectableMarkerPromoter" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Gene:</strong></td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerGene" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSelectableMarkerGene" runat="server" 
                    ErrorMessage="Selectable Marker Gene is required." 
                    ControlToValidate="tbSelectableMarkerGene" ValidationGroup="NewOrder">*</asp:RequiredFieldValidator>
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
                <h2>Additonal Information</h2></td>
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
                <div id="ValidationWarnings" style="display:none; color:Red;"></div>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="btnPlaceOrder" runat="server" ImageUrl="~/Images/btn_submitorder.png" Text="Submit Order" 
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
        <asp:ObjectDataSource ID="odsAgroStrain" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
            TypeName="CAESDO.PTF.BLL.AgroStrainBLL">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsPlantSelection" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
            TypeName="CAESDO.PTF.BLL.PlantSelectionBLL">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsGenoType" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
            TypeName="CAESDO.PTF.BLL.GenoTypeBLL">
        </asp:ObjectDataSource>
</asp:Content>


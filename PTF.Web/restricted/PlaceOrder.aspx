<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="restricted_PlaceOrder" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        	
        }
        .style3
        {
            width: 349px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table class="style1">
        <tr>
            <td class="style3">
                Principal Investigator: </td>
            <td>
                <asp:TextBox ID="tbPI" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style3">
                Mailing Address:</td>
            <td>
                Address Line 1<br />
                <asp:TextBox ID="tbMailing1" runat="server"></asp:TextBox>
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbMailing1_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbMailing1" WatermarkText="Street Address, P.O. Box, Comapny Name">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                Address Line 2<br />
                <asp:TextBox ID="tbMailing2" runat="server"></asp:TextBox>
                <AjaxControlToolkit:TextBoxWatermarkExtender ID="tbMailing2_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="tbMailing2" WatermarkText="Apartment, Suite, Unit, Building, Floor, etc.">
                </AjaxControlToolkit:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                State/Province/Region&nbsp;&nbsp;&nbsp; Zip / Postal Code<br />
                <asp:TextBox ID="tbMailingCity" runat="server"></asp:TextBox>
                <asp:TextBox ID="tbMailingState" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbMailingZip" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlMailingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Shipping Address:</td>
            <td>
                <asp:TextBox ID="tbShipping1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="tbShipping2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="tbShippingCity" runat="server"></asp:TextBox>
                <asp:TextBox ID="tbShippingState" runat="server"></asp:TextBox>
                <asp:TextBox ID="tbShippingZip" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlShippingCountry" runat="server" 
                    DataSourceID="odsCountry" DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact:</td>
            <td>
                <asp:TextBox ID="tbContact" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact E-mail:</td>
            <td>
                <asp:TextBox ID="tbContactEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact Phone:</td>
            <td>
                <asp:TextBox ID="tbContactPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Recharge Number:</td>
            <td>
                <asp:TextBox ID="tbRecharge" runat="server"></asp:TextBox>
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
                    DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Cultivar:</td>
            <td>
                <asp:TextBox ID="tbCultivar" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Number of Plants:</td>
            <td>
                <asp:TextBox ID="tbNumberofPlants" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="tbPlasmid" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Bacterial Selection:</td>
            <td>
                <asp:TextBox ID="tbBacterialSelection" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Agrobacterium Strain:</td>
            <td>
                <asp:TextBox ID="tbAgrobacteriumStrain" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Plant Selection:</td>
            <td>
                <asp:TextBox ID="tbPlantSelection" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Construct:</td>
            <td>
                <asp:TextBox ID="tbConstruct" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Name of Your Construct:</td>
            <td>
                <asp:TextBox ID="tbNameOfYourConstruct" runat="server"></asp:TextBox>
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
                    DataTextField="Name" DataValueField="ID">
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
                <asp:TextBox ID="tbGeneOfInterestPromoter" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbGeneOfInterestGene" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbGeneOfInterestTerminator" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="tbSelectableMarkerPromoter" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerGene" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbSelectableMarkerTerminator" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="tbScorableMarkerPromoter" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gene:</td>
            <td>
                <asp:TextBox ID="tbScorableMarkerGene" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Terminator:</td>
            <td>
                <asp:TextBox ID="tbScorableMarkerTerminator" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
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
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
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




</asp:Content>


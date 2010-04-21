<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lookups.aspx.cs" Inherits="Lookups" Title="PTF | Lookups" %>

<%@ Register TagPrefix="CAESDO" TagName="Lookups" Src="~/UserControls/LookupsView.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" 
        Height="500px" ActiveTabIndex="0">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Note Types" ID="TabPanel1">
            <ContentTemplate>
                
                <CAESDO:Lookups runat="server" ID="lookNoteTypes" TypeName="CAESDO.PTF.BLL.NoteTypeBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.NoteType" ValidationGroup="NoteTypes" />

            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Crops">
            <ContentTemplate>
              
                <CAESDO:Lookups runat="server" ID="lookCrops" TypeName="CAESDO.PTF.BLL.CropBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.Crop" ValidationGroup="Crops" />
                
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Agro Strain">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookAgroStrains" TypeName="CAESDO.PTF.BLL.AgroStrainBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.AgroStrain" ValidationGroup="AgroStrains" />
                
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="Status">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookStatus" TypeName="CAESDO.PTF.BLL.StatusBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.Status" ValidationGroup="Status" />
                
            </ContentTemplate>       
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="Selectable Marker">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookSelectableMarker" TypeName="CAESDO.PTF.BLL.SelectableMarkerBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.SelectableMarker" ValidationGroup="SelectableMarkers" />
                
            </ContentTemplate>        
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="Geno Type">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookGenoType" TypeName="CAESDO.PTF.BLL.GenoTypeBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.GenoType" ValidationGroup="GenoType" />
                
            </ContentTemplate>        
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="Trans Gene">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookTransGene" TypeName="CAESDO.PTF.BLL.TransGeneBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.TransGene" ValidationGroup="TransGene" />
                
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="Countries">
            <ContentTemplate>
            
                <CAESDO:Lookups runat="server" ID="lookCountry" TypeName="CAESDO.PTF.BLL.CountryBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.Country" ValidationGroup="Country" />
            
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
    </AjaxControlToolkit:TabContainer>
    
    </asp:Content>


<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lookups.aspx.cs" Inherits="Lookups" Title="PTF | Lookups" %>

<%@ Register TagPrefix="CAESDO" TagName="Lookups" Src="~/UserControls/LookupsView.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" 
        Height="500px" ActiveTabIndex="0">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Note Types" ID="TabPanel1">
            <ContentTemplate>
                <asp:UpdatePanel ID="upNoteTypes" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookNoteTypes" TypeName="CAESDO.PTF.BLL.NoteTypeBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.NoteType" ValidationGroup="NoteTypes" />
                    </ContentTemplate>
                </asp:UpdatePanel>               
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Crops">
            <ContentTemplate>
                <AjaxControlToolkit:TabContainer ID="tcCrops" runat="server">
                <AjaxControlToolkit:TabPanel ID="tpCrops" runat='server' HeaderText="Crops">
                    <ContentTemplate>
                        <asp:UpdatePanel ID="upCrops" runat="server">
                            <ContentTemplate>
                                <CAESDO:Lookups runat="server" ID="lookCrops" TypeName="CAESDO.PTF.BLL.CropBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.Crop" ValidationGroup="Crops" />
                            </ContentTemplate>
                        </asp:UpdatePanel>                     
                    </ContentTemplate>
                </AjaxControlToolkit:TabPanel>
                    <AjaxControlToolkit:TabPanel ID="tcPlantSelectionAssociation" runat='server' HeaderText="Plant Selection Association">
                    <ContentTemplate>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            
                                <asp:DropDownList ID="ddlCrops" runat="server" DataSourceID="odsCrops" AppendDataBoundItems="true" DataTextField="Name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddlCrops_OnSelectedIndexChange">
                                    <asp:ListItem Text="--Select a Crop--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                
                                <asp:CheckBoxList ID="cblPlantSelections" runat="server" DataSourceID="odsPlantSelections" DataValueField="id" DataTextField="name" Visible="false">
                                </asp:CheckBoxList>

                                <asp:LinkButton ID="lbSaveCropPlantSelection" runat="server" OnClick="lbSaveCropPlantSelection_OnClick" Visible="false">[Save]</asp:LinkButton>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                        
                    </ContentTemplate>
                </AjaxControlToolkit:TabPanel>
                </AjaxControlToolkit:TabContainer>
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Agro Strain">
            <ContentTemplate>
                <asp:UpdatePanel ID="upAgroStrains" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookAgroStrains" TypeName="CAESDO.PTF.BLL.AgroStrainBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.AgroStrain" ValidationGroup="AgroStrains" />
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="Plant Selection">
            <ContentTemplate>
                <asp:UpdatePanel ID="upPlantSelection" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookPlantSelection" TypeName="CAESDO.PTF.BLL.PlantSelectionBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.PlantSelection" ValidationGroup="PlantSelection" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>        
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="Geno Type">
            <ContentTemplate>
                <asp:UpdatePanel ID="upGenoType" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookGenoType" TypeName="CAESDO.PTF.BLL.GenoTypeBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.GenoType" ValidationGroup="GenoType" />
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </ContentTemplate>        
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="Trans Gene">
            <ContentTemplate>
                <asp:UpdatePanel ID="upTransGene" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookTransGene" TypeName="CAESDO.PTF.BLL.TransGeneBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.TransGene" ValidationGroup="TransGene" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="Countries">
            <ContentTemplate>
                <asp:UpdatePanel ID="upCountry" runat="server">
                    <ContentTemplate>
                        <CAESDO:Lookups runat="server" ID="lookCountry" TypeName="CAESDO.PTF.BLL.CountryBLL" DataObjectTypeName="CAESDO.PTF.Core.Domain.Country" ValidationGroup="Country" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
    </AjaxControlToolkit:TabContainer>
    
    <asp:ObjectDataSource ID="odsCrops" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CropBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPlantSelections" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.PlantSelectionBLL"></asp:ObjectDataSource>
    </asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lookups.aspx.cs" Inherits="Lookups" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" 
        ActiveTabIndex="0">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Note Types" ID="TabPanel1">
            <ContentTemplate>

                <asp:ListView ID="lvNoteTypes" runat="server" DataSourceID="odsNoteTypes">
                    <LayoutTemplate>
                        <ul class="Lookups">
                            <li id="ItemPlaceHolder" runat="server"></li>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:Panel runat="server" ID="pnlName" class="itemPanel">
                                <%# Eval("Name") %>
                                <asp:Button runat="server" ID="btnEditEnable" CommandName="Edit" />
                            </asp:Panel>
                        </li>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <li>
                            <asp:Panel runat="server" ID="pnlEdit" class="itemPanel">
                                <asp:TextBox ID="tbEdit" runat="server" Text='<%# Bind("Name") %>' />
                            </asp:Panel>
                        </li>
                    </EditItemTemplate>
                </asp:ListView>

            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Crops">
            <ContentTemplate>
            
                <asp:ListView ID="lvCrops" runat="server" DataSourceID="odsCrops">
                    <LayoutTemplate>
                        <ul class="Lookups">
                            <li id="ItemPlaceHolder" runat="server"></li>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li><asp:Panel runat="server" ID="pnlName" class="itemPanel"><%# Eval("Name") %></asp:Panel></li>
                    </ItemTemplate>
                </asp:ListView>
                
            </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
    </AjaxControlToolkit:TabContainer>
    
    <asp:ObjectDataSource ID="odsNoteTypes" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.NoteTypeBLL">
        <SelectParameters>
            <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
            <asp:Parameter DefaultValue="True" Name="ascending" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource> 
    <asp:ObjectDataSource ID="odsCrops" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
        TypeName="CAESDO.PTF.BLL.CropBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="Name" Name="propertyName" Type="String" />
                <asp:Parameter DefaultValue="True" Name="ascending" Type="Boolean" />
            </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>


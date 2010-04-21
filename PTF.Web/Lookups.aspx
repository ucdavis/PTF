<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lookups.aspx.cs" Inherits="Lookups" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" Height="500px"
        ActiveTabIndex="0">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Note Types" ID="TabPanel1">
            <ContentTemplate>

                <asp:ListView ID="lvNoteTypes" runat="server" DataSourceID="odsNoteTypes" InsertItemPosition="LastItem" DataKeyNames="Identifier">
                    <EditItemTemplate>
                        <li>
                            <asp:Panel runat="server" ID="pnlEdit" class="itemPanel">
                                <asp:TextBox ID="tbEdit" runat="server" Text='<%# Bind("Name") %>' />
                                <asp:ImageButton runat="server" ID="ibtnSave" ImageUrl="~/Images/save.png" CssClass="icon" CommandName="Update" ToolTip="Save Changes" />
                                <asp:ImageButton runat="server" ID="ibtnCancelSave" ImageUrl="~/Images/cancel.png" CssClass="icon" CommandName="Cancel" ToolTip="Cancel Changes" />
                                <asp:CheckBox ID="cbEdit" runat="server" Checked='<%# Bind("IsActive") %>' Visible="false" />
                            </asp:Panel>
                        </li>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <li>
                            <asp:TextBox ID="tbNewName" Text='<%# Bind("Name") %>' MaxLength="50" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNewName" runat="server" ErrorMessage="*" ControlToValidate="tbNewName" ValidationGroup="NewLookup"></asp:RequiredFieldValidator>                      
                            <asp:ImageButton runat="server" ID="ibtnInsert" ImageUrl="~/Images/add.png" ToolTip="Add New" CssClass="icon" CommandName="Insert" ValidationGroup="NewLookup" />
                        </li>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:Panel runat="server" ID="pnlName" class="itemPanel" >
                                <asp:ImageButton runat="server" ID="ibtnDelete" ImageUrl="~/Images/delete.png" CssClass="icon" CommandName="Delete" ToolTip="Delete" />
                                <AjaxControlToolkit:ConfirmButtonExtender ID="cbeDelete" TargetControlID="ibtnDelete" runat="server" ConfirmText="Are you sure you want to delete this lookup value?" />
                                <asp:ImageButton runat="server" ID="ibtnEdit" ImageUrl="~/Images/edit.png" CommandName="Edit" CssClass="icon" ToolTip="Edit" />
                                <%# Eval("Name") %></asp:Panel>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul class="Lookups">
                            <li id="ItemPlaceHolder" runat="server"></li>
                        </ul>
                    </LayoutTemplate>
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.NoteTypeBLL" 
        DataObjectTypeName="CAESDO.PTF.Core.Domain.NoteType" UpdateMethod="Update" 
        InsertMethod="Insert">
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


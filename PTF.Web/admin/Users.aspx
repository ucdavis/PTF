<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admin_Users" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" 
        ActiveTabIndex="1">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Staff Users" ID="TabPanel1">
        </AjaxControlToolkit:TabPanel>
        <AjaxControlToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Clients">
        <ContentTemplate>
            <asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="False" 
                DataSourceID="odsClients">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
                        SortExpression="UserName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="IsLockedOut" HeaderText="IsLockedOut" 
                        ReadOnly="True" SortExpression="IsLockedOut" />
                    <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" 
                        ReadOnly="True" SortExpression="CreationDate" />
                    <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" 
                        SortExpression="LastLoginDate" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
                        SortExpression="LastActivityDate" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="imgDropDown" ImageUrl="~/Images/dropdowntrigger.png" runat="server" />
                            <AjaxControlToolkit:DropDownExtender ID="ddeClients" runat="server" TargetControlID="imgDropDown" DropDownControlID="pnlClients" >
                            </AjaxControlToolkit:DropDownExtender>
                            <asp:Panel style="display:none; background:gray;" ID="pnlClients" runat="server">
                                <asp:LinkButton ID="lbReset" runat="server" CommandArgument='<%# Eval("ProviderUserKey") %>' oncommand="lbReset_Command">Reset Password</asp:LinkButton>
                                <br />
                                <asp:LinkButton ID="lbUnlock" runat="server" CommandArgument='<%# Eval("ProviderUserKey") %>' oncommand="lbUnlock_Command">Unlock</asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsClients" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                TypeName="CAESDO.PTF.BLL.ClientBLL"></asp:ObjectDataSource>
        </ContentTemplate>
        </AjaxControlToolkit:TabPanel>
        
    </AjaxControlToolkit:TabContainer>
</asp:Content>


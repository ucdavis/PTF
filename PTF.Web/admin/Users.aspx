<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admin_Users" Title="PTF | User Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <AjaxControlToolkit:TabContainer ID="TabContainer1" runat="server" 
        ActiveTabIndex="0">
        <AjaxControlToolkit:TabPanel runat="server" HeaderText="Staff Users" ID="TabPanel1">
            <HeaderTemplate>
                Staff Users
            </HeaderTemplate>
        <ContentTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

            <asp:LinkButton ID="lbNewUser" runat="server"><img src="../Images/btn_newuser.png" /></asp:LinkButton>
            <AjaxControlToolkit:ModalPopupExtender ID="mpeNewUser" runat="server" CancelControlID="btnAddUserCancel" 
                TargetControlID="lbNewUser" PopupControlID="pnlNewUser" DynamicServicePath="" 
                Enabled="True">
            </AjaxControlToolkit:ModalPopupExtender>
            <asp:Panel ID="pnlNewUser" CssClass="popup" runat="server" style="display:none;">
            <h2>Search For New User:</h2><br /><br />
                 Login ID:
                 <asp:TextBox ID="txtAddUserLoginID" runat="server"></asp:TextBox><br />
                 <br />
                 <asp:ImageButton ID="btnAddUserSearch" runat="server" OnClick="btnAddUserSearch_Click"
                     Text="Search" ImageUrl="~/Images/btn_lookup.png" />
                 <asp:ImageButton ID="btnAddUserCancel" runat="server" Text="Close" ImageUrl="~/Images/btn_close.png" />
                 <br />
                 <asp:Label ID="lblAddUserStatus" runat="server" ForeColor="Green" EnableViewState="False"></asp:Label><br />
                 
                <asp:ListView ID="lvViewAddUserSearch" runat="server" DataKeyNames="Login"
                    DataSourceID="odsUserSearch" Visible="false" 
                    onselectedindexchanged="lvViewAddUserSearch_SelectedIndexChanged">
                    <EmptyDataTemplate>
                        No Matching Users Found
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <table>
                            <tr>
                                <th>
                                </th>
                                <th>
                                    Login</th>
                                <th>
                                    Last Name</th>
                                <th>
                                    First Name</th>
                                <th>
                                    Employee ID</th>
                                <th>
                                    Email</th>
                                <th>
                                    Role</th>
                                <th>
                                    Unit</th>
                            </tr>
                            <tr ID="ItemPlaceHolder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbSelectUser" CommandName="Select" runat="server"><img src="../Images/btn_select.png" title="select" /></asp:LinkButton></td>
                            <td><%# Eval("Login") %></td>
                            <td><%# Eval("LastName") %></td>
                            <td><%# Eval("FirstName") %></td>
                            <td><%# Eval("EmployeeID") %></td>
                            <td><%# Eval("Email") %></td>
                            <td>
                                <asp:DropDownList ID="ddlAddUserRole" runat="server" DataSourceID="odsRoles" DataTextField="Role" DataValueField="RoleID" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select a Role--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                   <asp:ObjectDataSource ID="odsRoles" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetRoles" 
                                        TypeName="CatbertManager"></asp:ObjectDataSource>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAddUserUnit" runat="server" DataSourceID="odsUnit" DataTextField="Unit" DataValueField="UnitID" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select a Unit--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="odsUnit" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetUnits" 
                                        TypeName="CatbertManager"></asp:ObjectDataSource>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsUserSearch" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="SearchNewUsersByLogin" TypeName="CatbertManager">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtAddUserLoginID" Name="login" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        
            <asp:ListView ID="lvStaffUsers" runat="server" DataSourceID="odsStaffUsers" DataKeyNames="Login" 
                onselectedindexchanged="lvStaffUsers_SelectedIndexChanged">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lbSelect" CommandName="Select" runat="server"><img src="../Images/btn_select.png" title="select" /></asp:LinkButton></td>
                        <td><%# Eval("Login") %></td>
                        <td><%# Eval("Role") %></td>
                        <td><%# Eval("LastName") %></td>
                        <td><%# Eval("FirstName") %></td>
                        <td><%# Eval("EmployeeID") %></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table class="dataTable" cellpadding="0" cellspacing="0">
                        <tr class="head">
                            <th>
                            </th>
                            <th>
                                <asp:LinkButton ID="lbSortUserName" CommandName="Sort" CommandArgument="Login" runat="server">User Name</asp:LinkButton> 
                            </th>
                            <th>
                                <asp:LinkButton ID="lbSortRole" CommandName="Sort" CommandArgument="Role" runat="server">Role</asp:LinkButton></th>
                            <th>
                                <asp:LinkButton ID="lbSortLastName" CommandName="Sort" CommandArgument="LastName" runat="server">Last Name</asp:LinkButton>
                            </th>
                            <th>
                                <asp:LinkButton ID="lbSortFirstName" CommandName="Sort" CommandArgument="FirstName" runat="server">First Name</asp:LinkButton></th>
                            <th>
                                Employee ID</th>
                        </tr>
                        <tr ID="ItemPlaceHolder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>  
            
            <asp:Button ID="btnDummyUpdateUserInfo" runat="server" Text="Button" style="display:none;" />
            <AjaxControlToolkit:ModalPopupExtender ID="mpeUpdateUserInfo" runat="server" TargetControlID="btnDummyUpdateUserInfo" PopupControlID="pnlUpdateUserInfo" CancelControlID="lbCloseUserInfo">
            </AjaxControlToolkit:ModalPopupExtender>
            <asp:Panel ID="pnlUpdateUserInfo" runat="server" CssClass="popup" style="display:none;">
                <span class="ModalTitle">User Information for <asp:Label ID="lblUserInfoName" runat="server" Text=""></asp:Label> </span>
                
                <br />
                LoginID: <asp:Label ID="lblUserInfoLoginID" runat="server" Text="Label"></asp:Label><br />
                EmployeeID: <asp:Label ID="lblUserInfoEmployeeID" runat="server" Text="Label"></asp:Label><br /><br />
                
                <asp:ListView ID="lvUserUnits" runat="server" DataKeyNames="UnitID" 
                    onitemdeleting="lvUserUnits_ItemDeleting">
                    <LayoutTemplate>
                        <table class="dataTable" cellpadding="0" cellspacing="0">
                            <tr class="head">
                                <th>Unit</th>
                                <th>FIS Code</th>
                                <th>Remove</th>
                            </tr>
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FullName") %></td>
                            <td><%# Eval("FISCode") %></td>
                            <td>
                                <asp:LinkButton ID="lbDeleteUserRole" CommandName="Delete" runat="server"><img src="../Images/delete-x.png" alt="Delete" /></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                
                
                <asp:DropDownList ID="ddlUnits" DataTextField="Unit" DataValueField="UnitID" runat="server" DataSourceID="odsUnits">
                </asp:DropDownList>
                <asp:Button ID="btnAddUserUnit" runat="server" OnClick="btnAddUserUnit_Click" Text="Add Unit" />
                <br /><br />
                                                                
                <asp:ListView ID="lvUserRoles" runat="server" DataKeyNames="RoleID" 
                    onitemdeleting="lvUserRoles_ItemDeleting">
                    <LayoutTemplate>
                        <table class="dataTable" cellpadding="0" cellspacing="0">
                            <tr class="head">
                                <th>Role</th>
                                <th>Remove</th>
                            </tr>
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Role") %></td>
                            <td>
                                <asp:LinkButton ID="lbDeleteUserUnit" CommandName="Delete" runat="server"><img src="../Images/delete-x.png" alt="Delete" /></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                
                <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="odsRoles" DataTextField="Role" DataValueField="RoleID">
                </asp:DropDownList>
                <asp:Button ID="btnAddUserRole" runat="server" OnClick="btnAddUserRole_Click" Text="Add Role" />
                
                <br /><br />
                <asp:LinkButton ID="lbSaveUserInfo" runat="server"><img src="../Images/save.png" alt="Save" /></asp:LinkButton>
                <asp:LinkButton ID="lbCloseUserInfo" runat="server">[Close]</asp:LinkButton>
            </asp:Panel>
            
            <asp:ObjectDataSource ID="odsStaffUsers" runat="server" 
                OldValuesParameterFormatString="original_{0}" SortParameterName="sortExp" 
                SelectMethod="GetUsersInApplication" TypeName="CatbertManager"></asp:ObjectDataSource>
                
            <asp:ObjectDataSource ID="odsUnits" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetUnits" 
                        TypeName="CatbertManager"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsRoles" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetRoles" 
                        TypeName="CatbertManager"></asp:ObjectDataSource>    
            </ContentTemplate>
        </asp:UpdatePanel>
        </ContentTemplate>        
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


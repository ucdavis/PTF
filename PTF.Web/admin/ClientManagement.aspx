<%@ Page Title="PTF | Client Management" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientManagement.aspx.cs" Inherits="admin_ClientManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:ListView ID="lvClients" runat="server" DataSourceID="odsClients">
                <LayoutTemplate>
                    <div class="grid">
                    <table cellpadding="15" cellspacing="0">
                            <tr class="head">
                                <th class="first"></th>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Locked Out</th>
                                <th>Created</th>
                                <th>Last Login</th>
                                <th>Last Activity</th>
                            </tr>
                            <tr runat="server" id="ItemPlaceHolder"></tr>
                    </table>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="first">
                            <asp:LinkButton ID="lbReset" runat="server" OnCommand="lbReset_OnCommand" CommandArgument='<%# Eval("ProviderUserKey") %>'>[Reset]</asp:LinkButton>
                            |
                            <asp:LinkButton ID="lbUnlock" runat="server" OnCommand="lbUnlock_OnCommand" CommandArgument='<%# Eval("ProviderUserKey") %>'>[Unlock]</asp:LinkButton>
                        </td>
                        <td><%# Eval("UserName") %></td>
                        <td><%# Eval("Email") %></td>
                        <td><input type="checkbox" value='<%# Eval("IsLockedOut") %>' disabled /></td>
                        <td><%# Eval("CreationDate") %></td>
                        <td><%# Eval("LastLoginDate") %></td>
                        <td><%# Eval("LastActivityDate")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsClients" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                TypeName="CAESDO.PTF.BLL.ClientBLL"></asp:ObjectDataSource>

        

</asp:Content>


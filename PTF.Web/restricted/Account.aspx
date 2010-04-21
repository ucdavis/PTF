<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="restricted_Account" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="ChangePassword">
        <asp:ChangePassword ID="ChangePassword1" runat="server">
        </asp:ChangePassword>
    </div>

    <div id="Profile">
        <table>
            <tr>
                <td class="InfoFieldName">Address Line 1:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="InfoFieldName">Address Line 2:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="InfoFieldName">City:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="InfoFieldName">State:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsState" 
                        DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="InfoFieldName">Zip:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="InfoFieldName">Country:&nbsp;</td>
                <td class="InfoFieldValue">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsCountry" 
                        DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>

    <asp:ObjectDataSource ID="odsState" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.StateBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="CAESDO.PTF.BLL.CountryBLL"></asp:ObjectDataSource>
</asp:Content>


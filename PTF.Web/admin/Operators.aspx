<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Operators.aspx.cs" Inherits="admin_Operators" Title="PTF | Operators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="lvOperators" runat="server" DataSourceID="odsOperators" DataKeyNames="Identifier" InsertItemPosition="LastItem">
        <LayoutTemplate>
            <table>
                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Is Student</th>
                    <th>Effective ID</th>
                </tr>
                <tr runat="server" id="ItemPlaceHolder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit">[Edit]</asp:LinkButton>
                    <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete">[Delete]</asp:LinkButton>
                </td>
                <td><%# Eval("OperatorName") %></td>
                <td>
                    <asp:CheckBox ID="cbStudent" runat="server" Checked='<%# Eval("IsStudent") %>' Enabled=false />
                </td>
                <td><%# Eval("EffectiveID") %></td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update">[Update]</asp:LinkButton>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel">[Cancel]</asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("OperatorName") %>'></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbEditStudent" runat="server" Checked='<%# Bind("IsStudent") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tbEditEffectiveID" runat="server" Text='<%# Bind("EffectiveID") %>' Width="50px"></asp:TextBox>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbInsert" runat="server" CommandName="Insert">[Insert]</asp:LinkButton>
                </td>
                <td>
                    <asp:TextBox ID="tbInsertName" runat="server" Text='<%# Bind("OperatorName") %>'></asp:TextBox>
                </td>
                <td>
                    <asp:CheckBox ID="cbInsertStudent" runat="server" Text='<%# Bind("IsStudent") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tbInsertEffectiveID" runat="server" Text='<%# Bind("OperatorCode") %>'></asp:TextBox>
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>


    <asp:ObjectDataSource ID="odsOperators" runat="server" 
        DataObjectTypeName="CAESDO.PTF.Core.Domain.Operator" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetSelectable" TypeName="CAESDO.PTF.BLL.OperatorBLL" 
        UpdateMethod="Update"></asp:ObjectDataSource>


<%--    <asp:LinkButton ID="lbNewOperator" runat="server">[New Operator]</asp:LinkButton>
    <asp:GridView ID="gvOperators" runat="server" AutoGenerateColumns="False" 
        DataSourceID="odsOperators" DataKeyNames="Identifier">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="OperatorName" HeaderText="Name" SortExpression="OperatorName" />
            <asp:CheckBoxField DataField="IsStudent" HeaderText="IsStudent" 
                SortExpression="IsStudent" />
            <asp:CheckBoxField DataField="IsSelectable" HeaderText="IsSelectable" 
                SortExpression="IsSelectable" />
            <asp:BoundField DataField="EffectiveID" HeaderText="EffectiveID" 
                SortExpression="EffectiveID" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsOperators" runat="server" 
        DataObjectTypeName="CAESDO.PTF.Core.Domain.Operator" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetSelectable" TypeName="CAESDO.PTF.BLL.OperatorBLL" 
        UpdateMethod="Update"></asp:ObjectDataSource>
        
    <AjaxControlToolkit:ModalPopupExtender ID="mpeNewOperator" runat="server" TargetControlID="lbNewOperator" PopupControlID="pnlNewOperator" CancelControlID="btnCancel">
    </AjaxControlToolkit:ModalPopupExtender>
    
    <asp:Panel ID="pnlNewOperator" runat="server" CssClass="OperatorPanel">
        <asp:Button ID="btnCancel" runat="server" Text="X" style="float:right;" />  
        
        <br />
        
        Operator Name: <asp:TextBox ID="tbName" runat="server" MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="tbName" ValidationGroup="NewOperator"></asp:RequiredFieldValidator>
        <br />
        Preferred ID: <asp:TextBox ID="tbPreferredID" runat="server" Width="50px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revPerferredID" runat="server" ErrorMessage="Numbers Only." ControlToValidate="tbPreferredID" ValidationGroup="NewOperator" ValidationExpression="\d*"></asp:RegularExpressionValidator>
        <br />
        <asp:CheckBox ID="cbIsStudent" runat="server" Text="Is Student?" /><br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
            ValidationGroup="NewOperator" onclick="btnSubmit_Click" />
        
    </asp:Panel>--%>
</asp:Content>


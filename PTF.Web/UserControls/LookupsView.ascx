<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LookupsView.ascx.cs" Inherits="LookupsView" %>

  
    <asp:ListView ID="lvNoteTypes" runat="server" 
    InsertItemPosition="FirstItem" DataKeyNames="Identifier" 
    DataSourceID="odsLookups" onitemcreated="lvLookups_OnItemCreated">
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
                <asp:RequiredFieldValidator ID="rfvNewName" runat="server" ErrorMessage="*" ControlToValidate="tbNewName" ValidationGroup='<%# Eval("ValidationGroup") %>'> <%--ValidationGroup="NewLookup">--%></asp:RequiredFieldValidator>                      
                <asp:ImageButton runat="server" ID="ibtnInsert" ImageUrl="~/Images/add.png" ToolTip="Add New" CssClass="icon" CommandName="Insert" ValidationGroup='<%# Eval("ValidationGroup") %>' /> <%--ValidationGroup="NewLookup" />--%>
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
    
    
    <asp:ObjectDataSource ID="odsLookups" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete"></asp:ObjectDataSource>

<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" Title="PTF | Administrative Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function ValidateConstruct()
        {           
            var constructBox = $get('<%= tbConstructLookup.ClientID %>');
            
            var context = "construct"
            
            PageMethods.ValidateConstruct(constructBox.value, onComplete, null, context);
        }
        function ValidateExperiment()
        {
            var experimentBox = $get('<%= tbExperimentLookup.ClientID %>');
            
            var context = "experiment";
            
            PageMethods.ValidateExperiment(experimentBox.value, onComplete, null, context);
        }
        
        function onComplete(result, context)
        {       
            if (result > 0)
            {
                if (context == "construct")
                {
                    window.location = "Construct.aspx?cid=" + result;
                }
                else
                {
                    window.location = "Experiment.aspx?eid=" + result;
                }
            }
            else
            {
                alert("The " + context.type + " you entered is not valid.");
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="lookups">
    <ul class="menu">
    <li><a href=Reports.aspx><img src="../Images/menu_reports.png" title="Reports" /></a></li>
    <li><a href=Billing.aspx><img src="../Images/menu_billing.png" title="Billing" /></a></li>
    <li><a href=Labels.aspx><img src="../Images/menu_labels.png" title="Labels" /></a></li>
    <li><a href=ExistingData/Default.aspx><img src="../Images/menu_archive.png" title="Archived Data" /></a></li>
    </ul>
    <asp:Panel ID="pnlEmulation" runat="server" Visible="false" class="menu">
        <asp:TextBox ID="tbUserToEmulate" runat="server"></asp:TextBox>
        <asp:ImageButton ID="btnEmulate" runat="server" Text="Emulate User" onclick="btnEmulate_Click" ImageUrl="../Images/btn_emulateuser.png" />
        <asp:Literal ID="litCurrentEmulation" runat="server" Visible="false"></asp:Literal>
        <asp:Button ID="btnExitEmulation" runat="server" Text="Exit Emulation" onclick="btnExitEmulation_Click" Visible="false" />
        </asp:Panel>
    </div>
    <ul class="menu">
    <li><a href=Orders.aspx><img src="../Images/menu_orders.png" title="Orders" /></a></li>
    <li><a href=Lookups.aspx><img src="../Images/menu_lookups.png" title="Lookups" /></a></li>
    <li><a href=Operators.aspx><img src="../Images/menu_operators.png" title="Operators" /></a></li>
    <li><a href=Users.aspx><img src="../Images/menu_users.png" title="Users" /></a></li><%--
    <li><a href=Reports.aspx><img src="../Images/menu_reports.png" title="Reports" /></a></li>
    <li><a href=ExistingData/Default.aspx><img src="../Images/menu_archive.png" title="Archived Data" /></a></li>
    <li><a href=Billing.aspx><img src="../Images/menu_billing.png" title="Billing" /></a></li>
    <li><a href=Labels.aspx><img src="../Images/menu_labels.png" title="Labels" /></a></li>--%>
    </ul>
    <div class="menu clookup">
    <%--Construct Lookup:--%>
    <asp:TextBox ID="tbConstructLookup" runat="server"></asp:TextBox>
    <asp:LinkButton ID="lbConstructLookup" runat="server" OnClientClick="ValidateConstruct(); return false;" ><img src="../Images/btn_lookup.png" title="Look up" /></asp:LinkButton>
    </div>
    <div class="menu elookup">
    <%--Experiment Lookup:--%>
    <asp:TextBox ID="tbExperimentLookup" runat="server"></asp:TextBox>
    <asp:LinkButton ID="lbExperimentLookup" runat="server" OnClientClick="ValidateExperiment(); return false;" ><img src="../Images/btn_lookup.png" title="Look up" /></asp:LinkButton>
    </div>
</asp:Content>


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

    <ul style="list-style-type:none;">
    <li><a href=Orders.aspx>Orders</a></li>
    <li><a href=Lookups.aspx>Lookups</a></li>
    <li><a href=Operators.aspx>Operators</a></li>
    <li><a href=Users.aspx>Users</a></li>
    <li><a href=Reports.aspx>Reports</a></li>
    </ul>
    
    Construct Lookup:
    <asp:TextBox ID="tbConstructLookup" runat="server"></asp:TextBox>
    <asp:LinkButton ID="lbConstructLookup" runat="server" OnClientClick="ValidateConstruct(); return false;" >[Lookup]</asp:LinkButton>
    <br />
    <br />
    Experiment Lookup:
    <asp:TextBox ID="tbExperimentLookup" runat="server"></asp:TextBox>
    <asp:LinkButton ID="lbExperimentLookup" runat="server" OnClientClick="ValidateExperiment(); return false;" >[Lookup]</asp:LinkButton>
</asp:Content>


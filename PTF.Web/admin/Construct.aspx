<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Construct.aspx.cs" Inherits="admin_Construct" Title="PTF | Construct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../JS/Order.js"></script>
    <span class="ContractWarning">
        <asp:Literal ID="litContractNotExecuted" runat="server"></asp:Literal>
    </span>
    
    <script type="text/javascript">
        function ChangeLock(lockButton)
        {
            debugger;
        
            var constructID = '<%= Request.QueryString["cid"] %>';
        
            var context = new Object;
            context.button = lockButton;
            
            var newValue = false;
            
            if (lockButton.src.match("unlocked.png") == null)
            {
                // locked is the current image
                //lockButton.src = "../Images/unlocked.png";
                
                context.image = "../Images/unlocked.png";
                newValue = false;
            }
            else
            {
                // unlocked is the current image
                //lockButton.src = "../Images/locked.png";
                
                context.image = "../Images/locked.png";
                newValue = true;
            }
           
            ScriptServices.SaveProperty(constructID, "IsLocked", newValue, "Construct", ChangeLockOnComplete, null, context);
        }
        
        function ChangeLockOnComplete(result, context)
        {
            context.button.src = context.image;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="BackButton">
        <asp:LinkButton runat="server" id="lbBack" onclick="lbBack_Click"><img src="../Images/back.png" alt="" /> [Back to Order]</asp:LinkButton>
    </div>
     <table class="InfoTable">
        <tr class="head">
            <td colspan="3" style="vertical-align: bottom">Construct Information</td>
            <td style="text-align: right;">
                <asp:ImageButton ID="ibtnLock" runat="server" OnClientClick="ChangeLock(this); return false;" />
                <asp:ImageButton ID="lbGenerateInvoice" ImageUrl="../Images/btn_invoice.png" AlternateText="Invoice" runat="server" onclick="lbGenerateInvoice_Click" />                
            </td>
        </tr>
        <tr>
            <td class="InfoFieldName col1">Construct Code:&nbsp;</td>
            <td class="InfoFieldValue col2">
                <asp:Literal ID="litConstructCode" runat="server"></asp:Literal></td>
            <td class="InfoFieldName col3">Plant Selection:&nbsp;</td>
            <td class="InfoFieldValue col4">
                <asp:Literal ID="litPlantSelection" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Date Created:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litDateCreated" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Bacterial Selection:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litBacterialSelection" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
            <td class="InfoFieldName">Agro Strain:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litAgroStrain" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Crop:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litCrop" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">Plasmid:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPlasmid" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Genotype:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litGenotype" runat="server"></asp:Literal></td>
            <td class="InfoFieldName">PI Code:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litPICode" runat="server"></asp:Literal></td>
        </tr>
        <tr>
            <td class="InfoFieldName">Invoice Date:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:Literal ID="litInvoiceDate" runat="server"></asp:Literal></td>
            <td class="InfoFieldName"></td>
            <td class="InfoFieldValue"></td>
        </tr>     
        <tr>
            <td class="InfoFieldName">Recharge Amount:&nbsp;</td>
            <td class="InfoFieldValue">
                $<asp:TextBox ID="tbRecharge" runat="server" Width="50px"></asp:TextBox>               
                <a id="A1" onclick='if (Page_ClientValidate("Recharge")) { SaveProperty("<%= Request.QueryString["cid"] %>", "Recharge", "<%= tbRecharge.ClientID %>", "Construct"); }'><img src="../Images/save.png" width="20px" alt="save" />
                <span id="Recharge"></span><br />
                <asp:RegularExpressionValidator ID="revRecharge" ControlToValidate="tbRecharge" ValidationGroup="Recharge" ValidationExpression="^([1-9]{1}[\d]{0,2}(\,[\d]{3})*(\.[\d]{0,2})?|[1-9]{1}[\d]{0,}(\.[\d]{0,2})?|0(\.[\d]{0,2})?|(\.[\d]{1,2})?)$" runat="server" ErrorMessage="Not valid dollar amount."></asp:RegularExpressionValidator>
            </td>
            <td class="InfoFieldName">Status:&nbsp;</td>
            <td class="InfoFieldValue">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Literal ID="litStatus" runat="server"></asp:Literal>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>  
        <tr>
            <td class="InfoFieldName">
                <strong>Comments:</strong>
            </td>
            <td colspan="3" class="InfoFieldValue">
                <asp:TextBox ID="tbComments" runat="server" TextMode="MultiLine" Height="138px" Width="338px"></asp:TextBox>
                <a id="CommentsButton" onclick='SaveProperty("<%= Request.QueryString["cid"] %>", "Comment", "<%= tbComments.ClientID %>", "Construct");'><img src="../Images/save.png" width="20px" alt="save" />
                <span id="Comment"></span>
            </td>
        </tr>                          
    </table>
    <br />
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>   
    <asp:ImageButton ID="btnNewExperiment" runat="server" ImageUrl="~/Images/btn_createexp.png" Text="Create Experiment" CssClass="btnCreateexp" /><br />
    <asp:ListView ID="lvExperiments" runat="server">
        <LayoutTemplate>
            <div class="grid">
                <table cellpadding="10" cellspacing="0" class="construct">
                    <tr class="head">
                        <th class="first col1"></th>
                        <th class="col2">Experiment Code</th>
                        <th class="col3">Operator</th>
                        <th class="col4">Explant</th>
                        <th class="col5">Optical Density</th>
                        <th class="col6">Comments</th>
                    </tr>
                    <tr runat='server' id="itemplaceholder"></tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>  
            <tr id="row" runat='server' class="group">
                <td class="first"></td>
                <td class="firstnum"><a href='<%# "Experiment.aspx?eid=" + Eval("id") %>'><%# Eval("ExperimentCode") %></a></td>
                <td><%# Eval("Operator.OperatorName") %></td>
                <td><%# Eval("Explant") %></td>
                <td><%# Eval("OpticalDensity")%></td>
                <td><%# Eval("Comments") %></td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No experiments exist for this construct.
        </EmptyDataTemplate>
    </asp:ListView>
    
    <asp:Panel ID="pnlNewExperiment" runat="server" style="display:none;">
    <div class="popup">
        <div class="close">
            <asp:ImageButton ID="btnCancelNewExperiment" ToolTip="Close" ImageUrl="~/Images/btn_close.png" runat="server" Text="X" />
        </div>
        <h2>New Experiment</h2>
        <br /><br />
        <table id="dataTable"> 
            <tr>
                <td>Operator:&nbsp;</td>
                <td>
                    <asp:DropDownList ID="ddlOperators" runat="server" DataSourceID="odsOperators" 
                        DataTextField="OperatorName" DataValueField="ID" AppendDataBoundItems="true">
                            <asp:ListItem Text="--Select an Operator--" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvOperators" runat="server" ErrorMessage="*" ControlToValidate="ddlOperators" InitialValue="-1" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Seed Lot Number:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbSeedLotNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Explant:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbExplant" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvExplant" runat="server" ErrorMessage="*" ControlToValidate="tbExplant" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Optical Density:&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbOpticalDensity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvOpticalDensity" runat="server" ErrorMessage="*" ControlToValidate="tbOpticalDensity" ValidationGroup="NewExperiment"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revOpticalDensity" runat="server" ErrorMessage="*" ControlToValidate="tbOpticalDensity" ValidationGroup="NewExperiment" ValidationExpression="^[-+]?\d+(\.\d+)?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <span class="button"><asp:ImageButton ID="btnCreate" ImageUrl="~/Images/btn_create.png" runat="server" Text="Create" 
            onclick="btnCreate_Click" ValidationGroup="NewExperiment" /></span>
    </div>
    <p class="popup_bottom">&nbsp;</p>
    </asp:Panel>
    <AjaxControlToolkit:ModalPopupExtender ID="mpeNewExperiment" runat="server" BackgroundCssClass="popup_shadow" TargetControlID="btnNewExperiment" PopupControlID="pnlNewExperiment" CancelControlID="btnCancelNewExperiment">
    </AjaxControlToolkit:ModalPopupExtender>
       
    <asp:ObjectDataSource ID="odsOperators" runat="server" 
         OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectable" 
         TypeName="CAESDO.PTF.BLL.OperatorBLL"></asp:ObjectDataSource>
         
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


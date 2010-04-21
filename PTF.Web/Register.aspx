<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="PTF | Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="boxTitle"><img src="../Images/profile_sm.gif" style="vertical-align:middle;" alt="" /></span>
       
       <AjaxControlToolkit:NoBot ID="noBotNewUser" runat="server" />
    
    <asp:Wizard ID="wizCreateUser" runat="server" ActiveStepIndex="0" 
        BorderStyle="none" DisplaySideBar="False" OnFinishButtonClick="wizCreateUser_FinishButtonClick" CssClass="registerWizard">
        <StepStyle BorderWidth="0px" />
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" ValidationGroup="CreateAccount" />
        </StartNavigationTemplate>
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" StepType="finish" Title="Create Account">
              <table border="0" cellpadding="5" style="font-weight:bold;" class="noStyle">
                        <tr class="head">
                            <td rowspan="8" style="width: 30px">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                            <td rowspan="8" style="width: 10px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateAccount">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="EmailUCValid" runat="server" 
                                    ControlToValidate="Email" ValidationGroup="CreateAccount"
                                    ValidationExpression="ucdavis.edu$|berkeley.edu$|uci.edu$|ucla.edu$|ucmerced.edu$|ucr.edu$|ucsd.edu$|ucsf.edu$|ucsb.edu$|ucsc.edu$"
                                    ErrorMessage="Because the Facility is no longer accepting orders from outside the University of California System we are requiring new accounts to use their University of California campus assigned email address.  Please contact the Facility staff if you have questions or cannot create an account using your University email address."
                                    ToolTip="Because the Facility is no longer accepting orders from outside the University of California System we are requiring new accounts to use their University of California campus assigned email address.  Please contact the Facility staff if you have questions or cannot create an account using your University email address."
                                    >*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateAccount">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                    ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                    ValidationGroup="CreateAccount">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                    ErrorMessage="Security question is required." ToolTip="Security question is required."
                                    ValidationGroup="CreateAccount">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                    ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                    ValidationGroup="CreateAccount">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                    ValidationGroup="CreateAccount"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: red">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                <asp:ValidationSummary ID="ErrorMessages" ValidationGroup="CreateAccount" runat="server" />
                            </td>
                        </tr>
                    </table>
            </asp:WizardStep>
        </WizardSteps>
        <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.05em"
            ForeColor="White" HorizontalAlign="Left" />
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                Text="Previous" Visible="false" />
            <asp:ImageButton ID="FinishButton" ImageUrl="Images/btn_finish.png" runat="server" CommandName="MoveComplete" Text="Finish" ValidationGroup="CreateAccount" />
            <br /><br />
        </FinishNavigationTemplate>
    </asp:Wizard>
    

</asp:Content>


using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web.Security;
using CAESDO.PTF.Core.Domain;
using System.Configuration;
using System.Net;
using Microsoft.Reporting.WebForms;


namespace CAESDO.PTF.BLL
{
    public class EmailBLL
    {

        public static readonly string EmailHost = ConfigurationManager.AppSettings["EmailHost"];

        public static readonly string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"];

        public static string fromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
        public static string adminEmail = ConfigurationManager.AppSettings["AdminEmail"].ToString();
        public static string billingEmail = ConfigurationManager.AppSettings["BillingEmail"].ToString();
        public static string[] adminEmails = adminEmail.Split(';');
        public static string[] billingEmails = billingEmail.Split(';');

        public static readonly string TestEmail = ConfigurationManager.AppSettings["TestEmail"];

        private static readonly string ReportViewerUserName = ConfigurationManager.AppSettings["ReportViewerUser"];

        private static readonly string ReportViewerPassword = ConfigurationManager.AppSettings["ReportViewerPassword"];

        private static readonly string ReportViewerDomainName = ConfigurationManager.AppSettings["ReportViewerDomain"];

        public static void ResetPasswordEmail(Guid userKey, string newPassword)
        {
            var user = Membership.GetUser(userKey);

            MailMessage message = new MailMessage("automatedemail@caes.ucdavis.edu", user.UserName);
            message.Body = EmailText.ResetPasswordMessage.Replace("{password}", newPassword);
            message.Subject = "PTF Password Reset";
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Send(message);
        }

        protected static SmtpClient GetSmtpClient()
        {
            SmtpClient client = new SmtpClient(EmailHost)
            {
                Credentials = new NetworkCredential("", EmailPassword)
            };
            return client;
        }

        public static void OrderCreated(Order order)
        {
            // email the administrator specified in the webconfig
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            if (adminEmails.Count() > 0)
                foreach (var a in adminEmails)
                {
                    message.To.Add(a);
                } // add in all from from emails

            message.Body = EmailText.STR_NewOrder + "<br/>Order ID:" + order.ID.ToString();
            message.Subject = "PTF New Order Placed";
            message.IsBodyHtml = true;

            SmtpClient client = GetSmtpClient();
            client.Send(message);

#if DEBUG
            // email the client that their order has been placed
            MailMessage cmessage = new MailMessage(fromEmail, TestEmail);
            cmessage.Body = EmailText.STR_ClientConfirmationMessage;
            cmessage.Subject = "PTF Order Submitted";
            cmessage.IsBodyHtml = true;

            client.Send(cmessage);
#else
            // email the client that their order has been placed
            MailMessage cmessage = new MailMessage(fromEmail, order.ContactEmail);
            cmessage.Body = EmailText.STR_ClientConfirmationMessage;
            cmessage.Subject = "PTF Order Submitted";
            cmessage.IsBodyHtml = true;

            client.Send(cmessage);
#endif
        }

        public static void ConstructComplete(Construct construct)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail); // add in all the to emails
            if (adminEmails.Count() > 0)
                foreach (var a in adminEmails)
                {
                    message.To.Add(a);
                } // add in all from from emails

            message.Body = EmailText.STR_OrderCompleted + "<br/>Construct Code:" + construct.ConstructCode;
            message.Subject = "PTF Order Completed.";
            message.IsBodyHtml = true;

            SmtpClient client = GetSmtpClient();
            client.Send(message);
        }

        public static void Billing(Construct construct)
        {
            var deligate = new BeginInvoiceRequestDelegate(BeginInvoiceRequest);
            var callback = new AsyncCallback(EndInvoiceRequest);

            deligate.BeginInvoke(construct, callback, null);
        }

        private delegate void BeginInvoiceRequestDelegate(Construct construct);

        public static void BeginInvoiceRequest(Construct construct)
        {
            var reportName = "/PTF/Invoice";

            var parameters = new Dictionary<string, string>();
            parameters.Add("ConstructCode", construct.ConstructCode);

            var invoice = Get(reportName, parameters);
            var memoryStream = new MemoryStream(invoice);

            //var message = new MailMessage(fromEmail, billingEmail);
            var message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            if (billingEmails.Count() > 0)
                foreach (var a in billingEmails)
                {
                    message.To.Add(a);
                }

            if (adminEmails.Count() > 0)
                foreach (var a in adminEmails)
                {
                    message.To.Add(a);
                }

            message.Attachments.Add(new Attachment(memoryStream,
                string.Format("{0}_{1}.pdf", construct.Order.ID, construct.ConstructCode)));
            message.Body = EmailText.STR_Billing;
            message.Subject = "PTF Order Ready for Billing";
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Send(message);
        }

        public static void EndInvoiceRequest(IAsyncResult ar)
        {
            // do nothing for now
        }

        public static byte[] Get(string reportName, Dictionary<string, string> parameters)
        {
            string reportServer = ConfigurationManager.AppSettings["ReportServer"];

            var rview = new ReportViewer();

            IReportServerCredentials myCredentials =
                new CustomReportCredentials(ReportViewerUserName, ReportViewerPassword, ReportViewerDomainName);
            rview.ServerReport.ReportServerCredentials = myCredentials;

            rview.ServerReport.ReportServerUrl = new Uri(reportServer);
            rview.ServerReport.ReportPath = reportName;

            var paramList = new List<ReportParameter>();

            if (parameters.Count > 0)
            {
                foreach (KeyValuePair<string, string> kvp in parameters)
                {
                    paramList.Add(new ReportParameter(kvp.Key, kvp.Value));
                }
            }

            rview.ServerReport.SetParameters(paramList);

            string mimeType, encoding, extension, deviceInfo;
            string[] streamids;
            Warning[] warnings;

            string format = "PDF";
            deviceInfo = "<DeviceInfo>" + "<SimplePageHeaders>True</SimplePageHeaders>" + "</DeviceInfo>";

            byte[] bytes = rview.ServerReport.Render(format, deviceInfo, out mimeType, out encoding, out extension,
                out streamids, out warnings);

            return bytes;
        }

        public class CustomReportCredentials : IReportServerCredentials
        {
            private string _userName;
            private string _passWord;
            private string _domainName;

            public CustomReportCredentials(string userName, string passWord, string domainName)
            {
                _userName = userName;
                _passWord = passWord;
                _domainName = domainName;
            }

            public System.Security.Principal.WindowsIdentity ImpersonationUser
            {
                get { return null; }
            }

            public ICredentials NetworkCredentials
            {
                get { return new NetworkCredential(_userName, _passWord, _domainName); }
            }

            public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password,
                out string authority)
            {
                authCookie = null;
                user = password = authority = null;
                return false;
            }
        }
    }
}

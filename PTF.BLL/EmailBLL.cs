using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Web.Security;
using CAESDO.PTF.Core.Domain;
using System.Configuration;

namespace CAESDO.PTF.BLL
{
    public class EmailBLL
    {
        public static string adminEmail = ConfigurationManager.AppSettings["AdminEmail"].ToString();
        public static string fromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();

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

        public static void OrderCreated(Order order)
        {
            // email the administrator specified in the webconfig
            MailMessage message = new MailMessage(fromEmail, adminEmail);
            message.Body = EmailText.STR_NewOrder + "<br/>Order ID:" + order.ID.ToString();
            message.Subject = "PTF New Order Placed";
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Send(message);

            #if DEBUG
            // email the client that their order has been placed
            MailMessage cmessage = new MailMessage(fromEmail, "anlai@ucdavis.edu");
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
            MailMessage message = new MailMessage(fromEmail, adminEmail);
            message.Body = EmailText.STR_OrderCompleted + "<br/>Construct Code:" + construct.ConstructCode;
            message.Subject = "PTF Order Completed.";
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Send(message);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Web.Security;
using CAESDO.PTF.Core.Domain;

namespace CAESDO.PTF.BLL
{
    public class EmailBLL
    {
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

        public static void OrderCreated(Order order, string mailFromAddress, string mailToAddress)
        {
            MailMessage message = new MailMessage(mailFromAddress, mailToAddress);
            message.Body = EmailText.STR_NewOrder + "<br/>Order ID:" + order.ID.ToString();
            message.Subject = "PTF New Order Placed";
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Send(message);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Web.Security;

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
    }
}

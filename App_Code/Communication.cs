using System;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Net.Mime;
using System.Threading;
using System.Threading.Tasks;

/// <summary>
/// Communication class houses the methods used in communication i.e sending an email.
/// </summary>

public class Communication
{
    public static  bool Sendmail(string from, string name, string to, string subject, string body)
    {
        try
        {
            AlternateView altView = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
            //LinkedResource ttLogo = new LinkedResource(@"C:\inetpub\wwwroot\EMS 3.0\Images\ttlogoemail.png", MediaTypeNames.Image.Jpeg);
            //ttLogo.ContentId = "1234";
            //altView.LinkedResources.Add(ttLogo);
            LinkedResource ttHeader = new LinkedResource(@"C:\Users\PRIYANSHU\Documents\Visual Studio 2013\WebSites\EMS 3.0\Images\ttheaderemail.jpg", MediaTypeNames.Image.Jpeg);
            ttHeader.ContentId = "12345";
            altView.LinkedResources.Add(ttHeader);


            MailMessage msg = new MailMessage();
            msg.AlternateViews.Add(altView);
            SmtpClient sclient = new SmtpClient();
            NetworkCredential si = new NetworkCredential("register.techtrishna@gmail.com", "M@ps2015");
            sclient.UseDefaultCredentials = false;
            sclient.Credentials = si;
            //msg.Priority = MailPriority.Low;

            

            msg.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            msg.From = new MailAddress(from, name);
            msg.To.Add(to);
            msg.Subject = subject;
            msg.Body = body;
            msg.IsBodyHtml = true;        
            sclient.EnableSsl = true;
            sclient.Port = 587;
            sclient.Host = "smtp.gmail.com";
            sclient.DeliveryMethod = SmtpDeliveryMethod.Network;
            sclient.Send(msg);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}

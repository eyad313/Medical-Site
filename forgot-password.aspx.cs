using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace WebApplication2
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                heading.Text = "Forgot your password?";
                paragraph.Text = "Enter your email address and we will send you your old password.";
            }
        }

        protected void Reset(object sender, EventArgs e)
        {
            string username = "";
            string password = "";
            string email2 = inputEmail.Value.ToString();

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-LNDQ8MI\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select username, password from sign_up where email = '"+email2+"'  ", con);
            cmd.Parameters.AddWithValue("email", email2);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {

                if (sdr.Read())
                {
                    username = sdr["username"].ToString();
                    password = sdr["password"].ToString();

                }

            }
            con.Close();

            if (!string.IsNullOrEmpty(password))
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("eyad.lfc@gmail.com");
                msg.To.Add(email2);
                msg.Subject = " Recover your Password";
                msg.Body = ("Your Username is:" + username + "<br/><br/>" + "Your Password is:" + password);
                msg.IsBodyHtml = true;

                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "eyad.lfc@gmail.com"; //Your Email ID  
                ntwd.Password = "3Y2iiaUJ#89N25OOlld"; // Your Password  
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
                //lbmsg.Text = "Username and Password Sent Successfully";
                //lbmsg.ForeColor = System.Drawing.Color.ForestGreen;

                heading.Text = "Password Sent Successfully!";
                paragraph.Text = "";
            }
        }
    }
}
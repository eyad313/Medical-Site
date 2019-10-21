using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WelcomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string m = "anas";
            string m = Session["name"].ToString();
            Label1.Text = "Welcome " + m + "  ";
        }

        protected void complete_registration_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-LNDQ8MI\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");
            string w = Session["name"].ToString();
            con.Open();
            string qry1 = "select type_user from sign_up where username='" + w + "' ";
            SqlCommand cmd1 = new SqlCommand(qry1, con);
            SqlDataReader sdr1 = cmd1.ExecuteReader();
            sdr1.Read();
            string r = sdr1["type_user"].ToString();
            con.Close();

            if (r == "1")
            {
                Response.Redirect("patientForm4.aspx");
            }
            if (r == "2")
            {
                Response.Redirect("doctorForm3.aspx");
            }
            if (r == "3")
            {
                Response.Redirect("labForm2.aspx");
            }
        }
    }
}
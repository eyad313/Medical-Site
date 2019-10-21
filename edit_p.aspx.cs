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
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int t = Convert.ToInt32(Session["user_id"]);
                string a = Session["name"].ToString();
                con.Open();
                string qry = "select username, email from sign_up where ID='" + t + "' ";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                string username1 = sdr["username"].ToString();
                string email1 = sdr["email"].ToString();
                con.Close();
                con.Open();
                string qry1 = "select ssn,fname,lname,phone, convert(varchar,date_birth,103) as date_birth ,blood_type from sign_up_patient where P_ID='" + t + "' ";
                SqlCommand cmd1 = new SqlCommand(qry1, con);
                SqlDataReader sdr1 = cmd1.ExecuteReader();
                sdr1.Read();
                string ssn1 = sdr1["ssn"].ToString();
                string fname1 = sdr1["fname"].ToString();
                string lname1 = sdr1["lname"].ToString();
                string phone1 = sdr1["phone"].ToString();
                string dateofbirth1 = sdr1["date_birth"].ToString();
                string blood = sdr1["blood_type"].ToString();

                username.Text = username1;
                email.Text = email1;
                ssn.Text = ssn1;
                fname.Text = fname1;
                lname.Text = lname1;
                phone.Text = phone1;
                txtDatePicker.Text = dateofbirth1;
                blood_type.Text = blood;
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime oDate = DateTime.ParseExact(txtDatePicker.Text, "dd/MM/yyyy", null);

            int t = Convert.ToInt32(Session["user_id"]);
            string w = Session["name"].ToString();

            if (username.Text == w)
            {
                con.Open();
                string qry1 = "update sign_up_patient set ssn ='" + ssn.Text + "',fname ='" + fname.Text + "',lname ='" + lname.Text + "',phone ='" + phone.Text + "',date_birth='" + oDate + "',blood_type='" + blood_type.SelectedValue + "' where P_ID='" + t + "' ";
                SqlCommand cmd1 = new SqlCommand(qry1, con);
                cmd1.ExecuteNonQuery();
                con.Close();
                con.Open();
                string qry2 = "update sign_up set username ='" + username.Text + "',email='" + email.Text + "' where ID='" + t + "' ";
                SqlCommand cmd2 = new SqlCommand(qry2, con);
                cmd2.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Editting successfully completed";
            }

            else
            {
                con.Open();
                string qry3 = "select username from sign_up where username='" + username.Text + "' ";
                SqlCommand cm = new SqlCommand(qry3, con);
                SqlDataReader sdr3 = cm.ExecuteReader();
                bool a = sdr3.Read();
                con.Close();
                if (a == true)
                {
                    Response.Write("<script>alert('Username  Is exsits Try again..!!!')</script>");
                    //signup_div.Visible = true;
                    //login_div.Visible = false;
                    Label9.Text = "";
                }

                else
                {
                    con.Open();
                    string qry1 = "update  sign_up_patient set ssn ='" + ssn.Text + "',fname ='" + fname.Text + "',lname ='" + lname.Text + "',phone ='" + phone.Text + "',date_birth='" + txtDatePicker.Text + "',blood_type='" + blood_type.SelectedValue + "' where P_ID='" + t + "' ";
                    SqlCommand cmd1 = new SqlCommand(qry1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    string qry2 = "update  sign_up set username ='" + username.Text + "',email='" + email.Text + "' where ID='" + t + "' ";
                    SqlCommand cmd2 = new SqlCommand(qry2, con);
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "Editting successfully completed";

                }
            }



        }


        protected void username_TextChanged1(object sender, EventArgs e)
        {
            string w = Session["name"].ToString();
            if (username.Text == w)
            {
                Label9.Text = "";
            }
            else
            {
                con.Open();
                string qry = "select username from sign_up where username='" + username.Text + "' ";
                SqlCommand cm = new SqlCommand(qry, con);
                SqlDataReader sdr = cm.ExecuteReader();
                if (sdr.Read())
                {
                    Label9.Text = "Username  Is exsits Try again..!!!";

                }
                else
                {
                    Label9.Text = "";
                }
                con.Close();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("main_page_p.aspx");
        }
    }

}
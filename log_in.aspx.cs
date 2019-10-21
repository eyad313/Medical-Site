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
    public partial class log_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userid"] != null)

                    username1.Text = Request.Cookies["userid"].Value;

                if (Request.Cookies["pwd"] != null)

                    password1.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    remember.Checked = true;
            }
        }
        protected void Button0_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-LNDQ8MI\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");
                string uid = username1.Text;
                string pass = password1.Text;

                con.Open();
                string qry = "select username ,password from sign_up where username='" + uid + "' and password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                bool c = sdr.Read();
                con.Close();
                Session.Add("name", uid);

                if (c == true)
                {
                    if (remember.Checked == true)
                    {
                        Response.Cookies["userid"].Value = username1.Text;
                        Response.Cookies["pwd"].Value = password1.Text;
                        Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                    }

                    else
                    {
                        Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                    }

                    con.Open();
                    string qry1 = "select ID, type_user from sign_up where username='" + uid + "' ";
                    SqlCommand cmd1 = new SqlCommand(qry1, con);
                    SqlDataReader sdr1 = cmd1.ExecuteReader();
                    sdr1.Read();
                    int t = Convert.ToInt32(sdr1["ID"]);
                    string r = sdr1["type_user"].ToString();
                    con.Close();
                    Session.Add("user_id", t);
                    con.Open();
                    string qry2 = "select * from sign_up_patient p ,sign_up_doctor d ,sign_up_lab l  where p.P_ID='" + t + "' or d.D_ID='" + t + "' or l.L_ID='" + t + "'  ";
                    SqlCommand cmd2 = new SqlCommand(qry2, con);
                    SqlDataReader sdr2 = cmd2.ExecuteReader();
                    bool d = sdr2.Read();
                    sdr2.Close();
                    con.Close();
                    

                    if (d == false)
                    {
                        Response.Redirect("WelcomePage.aspx");
                    }

                    else
                    {
                        if (r == "1")
                        {
                            Response.Redirect("main_page_p.aspx");
                        }
                        if (r == "2")
                        {
                            Response.Redirect("Main_page_d.aspx");
                        }
                        if (r == "3")
                        {
                            Response.Redirect("Main_page_l.aspx");
                        }
                    }
                }

                else
                {
                    Response.Write("<script>alert('Username & Password Is not correct Try again..!!!')</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
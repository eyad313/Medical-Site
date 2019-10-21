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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection con1 = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");

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
                string qry1 = "select name,phone,address,City,Area from sign_up_lab where L_ID='" + t + "' ";
                SqlCommand cmd1 = new SqlCommand(qry1, con);
                SqlDataReader sdr1 = cmd1.ExecuteReader();
                sdr1.Read();
                string name = sdr1["name"].ToString();

                string phone1 = sdr1["phone"].ToString();

                string address = sdr1["address"].ToString();
                int city_id = Convert.ToInt32(sdr1["City"]);
                int area_id = Convert.ToInt32(sdr1["Area"]);
                con1.Open();
                string qry2 = "select Area from area where Area_ID='" + area_id + "' ";
                SqlCommand cmd2 = new SqlCommand(qry2, con1);
                SqlDataReader sdr2 = cmd2.ExecuteReader();
                sdr2.Read();
                string area1 = sdr2["Area"].ToString();
                con1.Close();

                con1.Open();
                string qry3 = "select City_Name from City where City_ID='" + city_id + "' ";
                SqlCommand cmd3 = new SqlCommand(qry3, con1);
                SqlDataReader sdr3 = cmd3.ExecuteReader();
                sdr3.Read();
                string city1 = sdr3["City_Name"].ToString();
                con1.Close();
                con1.Open();
                string qry4 = "select Area from area where City_ID = '" + city_id + "'  ";
                SqlCommand cmd4 = new SqlCommand(qry4, con1);
                SqlDataReader sdr4 = cmd4.ExecuteReader();
                sdr4.Read();
                string a1 = sdr4["Area"].ToString();
                

                Area.Items.Add(sdr4[0].ToString());
                while (sdr4.Read())
                {
                    Area.Items.Add(sdr4[0].ToString());
                }

                con1.Close();


                username.Text = username1;
                email.Text = email1;
                name_lab.Text = name;
                phone.Text = phone1;
                int s1 = City.Items.IndexOf(City.Items.FindByValue(city_id.ToString()));
                int s2 = Area.Items.IndexOf(Area.Items.FindByValue(area1.ToString()));
               
                City.Items[s1].Selected = true;
                Area.Items[s2].Selected = true;
                address_lab.InnerText = address;

                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            
            string w = Session["name"].ToString();
            int t =Convert.ToInt32 (Session["user_id"]);
            con1.Open();
            string qry3 = "select  Area_ID from area where Area = N'" + Area.SelectedValue + "'  ";
            SqlCommand cmd3 = new SqlCommand(qry3, con1);
            SqlDataReader sdr3 = cmd3.ExecuteReader();
            sdr3.Read();
            int area_id = Convert.ToInt32(sdr3["Area_ID"]);
            con1.Close();

            con.Close();
            if (username.Text == w)
            {
                con.Open();
                string qry1 = "update sign_up_lab set name ='" + name_lab.Text + "',phone ='" + phone.Text + "',address=N'" + address_lab.InnerText + "',City='" + City.SelectedValue + "',Area='" +area_id + "' where L_ID='" + t + "' ";
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
            else
            {
                con.Open();
                string qry4 = "select username from sign_up where username='" + username.Text + "' ";
                SqlCommand cm = new SqlCommand(qry4, con);
                SqlDataReader sdr4 = cm.ExecuteReader();
                bool a = sdr4.Read();
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
                    string qry1 = "update  sign_up_lab set name ='" + name_lab.Text + "',phone ='" + phone.Text + "',address=N'" + address_lab.InnerText + "',City='" + City.SelectedValue + "',Area='" + area_id + "' where L_ID='" + t + "' ";
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

        protected void username_TextChanged(object sender, EventArgs e)
        {

            int t = Convert.ToInt32(Session["user_id"]);

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
            Response.Redirect("Main_page_l.aspx");
        }

        protected void City_SelectedIndexChanged(object sender, EventArgs e)
        {
            Area.Items.Clear();

            int i = Convert.ToInt32(City.SelectedValue);
            con1.Open();
            string qry1 = "select Area from area where City_ID = '" + i + "'  ";
            SqlCommand cmd1 = new SqlCommand(qry1, con1);
            SqlDataReader sdr1 = cmd1.ExecuteReader();
            sdr1.Read();
            string area1 = sdr1["Area"].ToString();
            Area.Items.Add("Select Area");

            Area.Items.Add(sdr1[0].ToString());
            while (sdr1.Read())
            {
                Area.Items.Add(sdr1[0].ToString());
            }

            con1.Close();

        }
    }
}
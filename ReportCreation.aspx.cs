using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Collections;

namespace WebApplication2
{
    public partial class ReportCreation : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("onClick", "JavaScript:window.history.back(1);return false;");

            string qry = "select name from sign_up_lab;";

            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();

            lab_name.Items.Add(sdr[0].ToString());
            while (sdr.Read())
            {
                lab_name.Items.Add(sdr[0].ToString());
            }
            sdr.Close();
            con.Close();


            if (!IsPostBack)
            {
                if (System.Web.HttpContext.Current.Session["message"] != null)
                {
                    message.InnerText = (string)Session["message"];
                }
                else
                    message.InnerText = "";

                if (System.Web.HttpContext.Current.Session["prev_tests"] != null)
                {
                    TextArea3.InnerText = Session["prev_tests"].ToString();
                }

                if (System.Web.HttpContext.Current.Session["tests_to_take"] != null)
                {
                    TextArea4.InnerText = Session["tests_to_take"].ToString();
                }

                if (this.Session["Lab"]!=null)
                    lab_name.SelectedValue = (string)this.Session["Lab"];

                if (this.Session["Sample_Type"] != null)
                    sample_type.Text = (string)this.Session["Sample_Type"];

                if (this.Session["Sample_Date"] != null)
                    txtDatePicker.Text = (string)this.Session["Sample_Date"];

                if (this.Session["Family_History"] != null)
                    TextArea1.InnerText = (string)this.Session["Family_History"];

                if (this.Session["Referral_Reason"] != null)
                    TextBox3.Text = (string)this.Session["Referral_Reason"];

                if (this.Session["Recent_Medications"] != null)
                    TextBox4.Text = (string)this.Session["Recent_Medications"];

                if (this.Session["Extra_Notes"] != null)
                    TextArea2.InnerText = (string)this.Session["Extra_Notes"];

                int u_id = Convert.ToInt32(Session["user_id"].ToString());
                int p_id = Convert.ToInt32(Session["p_id"].ToString());
                string qry1 = "select * from sign_up_doctor where '" + u_id + "' = d_id";
                string qry2 = "select * from sign_up_patient where '" + p_id + "' = p_id";

                con.Open();
                cmd = new SqlCommand(qry1, con);
                sdr = cmd.ExecuteReader();
                sdr.Read();
                //--------------------------------------------------------------------------------------------------
                string name_doctor = sdr["fname"].ToString() + " " + sdr["lname"].ToString();
                string number = sdr["phone"].ToString();
                doctor_name.Text = name_doctor;
                doctor_id.Text = u_id.ToString();
                phone_number.Text = number;
                sdr.Close();
                //--------------------------------------------------------------------------------------------------
                cmd = new SqlCommand(qry2, con);
                sdr = cmd.ExecuteReader();
                sdr.Read();
                string name_patient = sdr["fname"].ToString() + " " + sdr["lname"].ToString();
                string date_birth = sdr["date_birth"].ToString();
                date_birth = date_birth.Substring(0, date_birth.IndexOf(" "));
                string sex = sdr["gender"].ToString();
                patient_name.Text = name_patient;
                dob.Text = date_birth;
                gender.Text = sex;
                sdr.Close();
                con.Close();
            }
        }

        protected void Confirm(object sender, EventArgs e)
        {
            int u_id = Convert.ToInt32(Session["user_id"].ToString());
            int p_id = Convert.ToInt32(Session["p_id"].ToString());
            int d_id = Convert.ToInt32(Session["diagnosis_id"]);
            string l_name = lab_name.SelectedValue.ToString();
            string qry = "select l_id from sign_up_lab where name = '" + l_name + "' ;";

            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            int l_id = Convert.ToInt32(sdr["l_id"]);
            con.Close();
            sdr.Close();

            // Continue later
            DateTime oDate = DateTime.ParseExact(txtDatePicker.Text, "dd/MM/yyyy", null);
            DateTime now = DateTime.Now;

            qry = "insert into request values ('"+p_id+ "', '"+l_id+ "', '"+u_id+ "', '"+d_id+ "', '"+TextArea4.InnerText+ "', '"+now+"', '"+sample_type.Text+ "', '"+oDate+"', '"+TextArea3.InnerText+"', '"+TextArea1.InnerText+"', '"+TextBox3.Text+"', '"+TextBox4.Text+"', '"+TextArea2.InnerText+"')";

            con.Open();
            cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("PatientSearch.aspx");
        }

        protected void TestSelect(object sender, EventArgs e)
        {
            SavePage();
            Response.Redirect("TestSearch.aspx");
        }

        protected void PrevTestAdd(object sender, EventArgs e)
        {
            SavePage();
            Response.Redirect("PrevTestSearch.aspx");
        }

        public void SavePage()
        {
            this.Session["Lab"] = lab_name.SelectedValue;
            this.Session["Sample_Type"] = sample_type.Text;
            this.Session["Sample_Date"] = txtDatePicker.Text;
            this.Session["Family_History"] = TextArea1.InnerText;
            this.Session["Referral_Reason"] = TextBox3.Text;
            this.Session["Recent_Medications"] = TextBox4.Text;
            this.Session["Extra_Notes"] = TextArea2.InnerHtml;
        }
    }
}
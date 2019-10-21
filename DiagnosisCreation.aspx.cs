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


// Diagnose Page

namespace WebApplication2 {
    public partial class DiagnosisCreation : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Attributes.Add("onClick", "JavaScript:window.history.back(1);return false;");

            if (!IsPostBack)
            {
                String id = Session["p_id"].ToString();
                con.Open();
                string qry1 = "select fname, lname from sign_up_patient where P_ID='" + id + "' ";
                SqlCommand cmd1 = new SqlCommand(qry1, con);
                SqlDataReader sdr = cmd1.ExecuteReader();
                sdr.Read();
                string name = sdr["fname"].ToString();
                string lname = sdr["lname"].ToString();
                con.Close();

                TextBox1.Text = "Patient ID: " + id;
                TextBox2.Text = "Name: " + name;
                TextBox6.Text = "Surname: " + lname;
                TextBox5.Text = "Doctor ID: " + Convert.ToInt32(Session["user_id"]);

            }

        }

        protected void Confirm(object sender, EventArgs e)
        {
            Diagnosis_Creation();
            Response.Redirect("PatientSearch.aspx");
        }

        protected void Report_Create(object sender, EventArgs e)
        {
            Diagnosis_Creation();
            Response.Redirect("ReportCreation.aspx");
        }

        public void Diagnosis_Creation()
        {
            String info = TextArea1.InnerText;
            String id2 = Session["p_id"].ToString();
            string Complain = TextBox3.Text;

            DateTime now = DateTime.Now;

            con.Open();
            string qry = "insert into diagnosis (P_ID, D_ID, Complain, Diagnosis, date_of_creation) values ('" + id2 + "', '" + Convert.ToInt32(Session["user_id"]) + "', '" + Complain + "', '" + info + "', '" + now + "');";

            // where ID = " + id2 + "
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();

            qry = "select ID from diagnosis where ID = (select MAX(ID) from diagnosis);";
            cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            Session.Add("diagnosis_id", Convert.ToInt32(sdr["ID"]));

            con.Close();
            Session.Add("message", "Diagnosis successfully created");
            
        }
    }
}

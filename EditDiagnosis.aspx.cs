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

// Edit Page

namespace WebApplication2
{
    public partial class EditDiagnosis : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Attributes.Add("onClick", "javascript:history.back(); return false;");

            TextArea1.Visible = false;
            Button1.Visible = false;
            TextBox3.Visible = false;

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

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowIndex];

            if(e.CommandName=="Edit")
            {
                string diagnosis_id = row.Cells[1].Text;
                Session.Add("diagnosis_id", diagnosis_id);

                GridView1.Visible = false;
                TextArea1.Visible = true;
                Button1.Visible = true;
                TextBox3.Visible = true;

                con.Open();
                string q = "select * from diagnosis where ID = '" + diagnosis_id + "' ;";
                SqlCommand cmd = new SqlCommand(q, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                string text = sdr["diagnosis"].ToString();
                TextBox3.Text = sdr["Complain"].ToString();
                TextArea1.InnerText = text;
                sdr.Close();
                con.Close();
            }
        }

        protected void Confirm(object sender, EventArgs e)
        {
            //String info = TextArea1.InnerText;
            //String id2 = Session["p_id"].ToString();
            //string Complain = TextBox3.Text;
            int x = Convert.ToInt32(Session["diagnosis_id"]);

            string s = TextBox3.Text;
            string s2 = TextArea1.InnerText;

            con.Open();
            string qry = "update diagnosis set Complain= '" + s + "', Diagnosis='" + s2 + "' where ID = '" + x + "' ;";

            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();

            Session.Remove("diagnosis_id");
            con.Close();

            Session.Add("message", "Diagnosis successfully edited");
            Response.Redirect("PatientSearch.aspx");
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Checking the RowType of the Row 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string cell = e.Row.Cells[0].Text;
                int dash_index = cell.IndexOf('-');
                cell = cell.Substring(0, dash_index);
                int d_id = Convert.ToInt32(cell);
                int doctor_id = Convert.ToInt32(Session["user_id"]);
                //If the diagnosis is created by a doctor other than the one logged in, the edit button will be disabled
                if (doctor_id != d_id)
                {
                    e.Row.Cells[4].Enabled = false;
                }
            }

            //To merge rows with same doctor name

            int RowSpan = 2;
            for (int i = GridView1.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = GridView1.Rows[i];
                GridViewRow prevRow = GridView1.Rows[i + 1];
                if (currRow.Cells[0].Text == prevRow.Cells[0].Text)
                {
                    currRow.Cells[0].RowSpan = RowSpan;
                    prevRow.Cells[0].Visible = false;
                    RowSpan += 1;
                }
                else
                {
                    RowSpan = 2;
                }
            }
        }
    }
}
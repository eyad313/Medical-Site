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


namespace WebApplication2 
{
    public partial class PatientSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["message"] != null)
            {
                string s = Session["message"].ToString();
                string msg1 = "Diagnosis successfully created", msg2 = "Diagnosis successfully edited";

                if (s == msg1)
                {
                    message.InnerText = msg1;
                    Session.Remove("message");
                }
                else if (s == msg2)
                {
                    message.InnerText = msg2;
                    Session.Remove("message");
                }
                else
                    message.InnerText = "";
            }
            else
                message.InnerText = "";
        }


        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[rowIndex];

            String id = row.Cells[0].Text;

            Session.Add("p_id", id);

            if (e.CommandName == "View")
            {
                Response.Redirect("PatientView.aspx");
            }

            if (e.CommandName == "Diagnose")
            {
                Response.Redirect("DiagnosisCreation.aspx");
            }

            if (e.CommandName == "Edit")
            {
                Response.Redirect("EditDiagnosis.aspx");
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
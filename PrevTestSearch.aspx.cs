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
    public partial class PrevTestSearch : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=DESKTOP-LNDQ8MI\\SQLEXPRESS01;Initial Catalog=anas;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void send(object sender, EventArgs e)
        {
            Textarea.InnerText = " ";
            
            var rows = GridView1.Rows;
            int count = GridView1.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                bool isChecked = ((CheckBox)rows[i].FindControl("CheckBox1")).Checked;
                if (isChecked)
                {
                    Textarea.InnerText += rows[i].Cells[0].Text + '\n';
                }
                
            }
            string s = Textarea.InnerText;
            Session.Add("prev_tests", s);
        }

        protected void finish(object sender, EventArgs e)
        {
            Response.Redirect("ReportCreation.aspx");
        }

        protected void cancel(object sender, EventArgs e)
        {
            Session.Remove("prev_tests");
            Response.Redirect("ReportCreation.aspx");
        }
    }
}
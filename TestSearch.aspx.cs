using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication2
{
    public partial class TestSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                createDataTable();
            }
        }

        DataTable dt;

        private void createDataTable()
        {
            dt = new DataTable();

            DataColumn dc = new DataColumn("Test Name");

            dt.Columns.Add(dc);

            DataRow dr;

            string[] s = new string[] { "Liver Antigen Profile", "First Trimester Prenatal Interpretive Screening", "Multi Drug Screen", "Neuronal Nuclear Antigens, IgG Serum", "H pylori antigen in stool", "Anti Mullerian hormone: a new marker for ovarian reserve", "Spinal Muscular Atrophy in blood and amniotic fluid", "Y Chromosome Microdeletions", "Human Papilloma Virus", "Lipoprotein a", "Prostate Cancer Antigen gene  (PCA3)", "Microdeletion panel", "Food Intolerance using ImuPro", "Extractable Nuclear autoantibodies – ENA" };

            for (int i = 0; i < 14; i++)
            {
                dr = dt.NewRow();
                dr["Test Name"] = s[i];
                dt.Rows.Add(dr);
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
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
            Session.Add("tests_to_take", s);
        }

        protected void finish(object sender, EventArgs e)
        {
            Response.Redirect("ReportCreation.aspx");
        }

        protected void cancel(object sender, EventArgs e)
        {
            Session.Remove("tests_to_take");
            Response.Redirect("ReportCreation.aspx");
        }
    }
}
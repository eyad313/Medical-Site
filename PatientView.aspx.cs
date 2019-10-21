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

// View Page

namespace WebApplication2
{
    public partial class PatientView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            String id = Session["p_id"].ToString();
            
        }
    }
}
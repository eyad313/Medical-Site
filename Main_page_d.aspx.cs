using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String p = Request.QueryString["SuccessMsg"];
                if (p == "1")
                    Label1.Text = "Your account has been successfully created.";
            }
        }
    }
}
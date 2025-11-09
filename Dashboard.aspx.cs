using System;
using System.Web.UI;

namespace Hospital
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Security check
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("WebForm1.aspx"); // Login page
            }
        }
    }
}

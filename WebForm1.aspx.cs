using System;
using System.Web.UI;

namespace Hospital
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string gmail = txtGmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Example hardcoded admin credentials
            string adminEmail = "admin@gmail.com";
            string adminPassword = "admin123";

            if (gmail == adminEmail && password == adminPassword)
            {
                // Redirect to admin dashboard or next page
                Response.Redirect("DashboardAdmin.aspx");
            }
            else
            {
                lblError.Text = "Invalid Gmail or Password!";
            }
        }
    }
}

using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE Email=@Email AND Password=@Password", con);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                // login success → redirect
                Response.Redirect("DashboardAdmin.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Email or Password!";
            }
            con.Close();
        }
    }
}

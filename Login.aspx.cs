using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
           

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Email = '" + txtEmail.Text
                           + "' AND Password = '" + txtPassword.Text + "'";

            cmd = new SqlCommand(query, con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0)
            {
                Session["UserEmail"] = txtEmail.Text;
                Response.Redirect("Home.aspx"); 
            }
            else
            {
                lblMsg.Text = "Invalid email or password.";
            }
        }
    }
}

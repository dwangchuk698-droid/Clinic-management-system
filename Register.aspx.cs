using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Hospital
{
    public partial class Register : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlDataAdapter da;
        SqlDataSource ds;
        SqlCommand cmd;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void clen()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into Users(FullName,Email,Password,Mobile) values('" + txtName.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','"+ txtMobile.Text +"')", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("Login.aspx");
            clen();


        }
    }
}
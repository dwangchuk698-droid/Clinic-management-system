using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Contact : System.Web.UI.Page
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

        void clear()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();

            string query = "INSERT INTO Contacts (Name, Email, Subject, Message, CreatedDate) VALUES ('"
                            + txtName.Text.Trim() + "', '"
                            + txtEmail.Text.Trim() + "', '"
                            + txtSubject.Text.Trim() + "', '"
                            + txtMessage.Text.Trim() + "', GETDATE())";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "✅ Your message has been sent.";

            clear();
        }
    }
}

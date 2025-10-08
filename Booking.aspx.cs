using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Booking : System.Web.UI.Page
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
            txtMobile.Text = "";
            ddlDoctor.SelectedIndex = 0;
            txtDate.Text = "";
            txtMessage.Text = "";
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            getcon();
            string query = "INSERT INTO Bookings (PatientName, Email, Mobile, Doctor, AppointmentDate, Message, CreatedDate) " +
                           "VALUES ('" + txtName.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" + txtMobile.Text.Trim() + "', '" +
                           ddlDoctor.SelectedValue + "', '" + txtDate.Text + "', '" + txtMessage.Text.Trim() + "', GETDATE())";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "✅ Appointment booked successfully!";

            clear();
        }
    }
}

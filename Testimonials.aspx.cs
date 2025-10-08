using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Testimonials : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTestimonials();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtName.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();
            string query = "INSERT INTO Testimonials (PatientName, Message, CreatedDate) VALUES " +
                           "('" + txtName.Text.Trim() + "', '" + txtMessage.Text.Trim() + "', GETDATE())";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            lblMsg.Text = "✅ Thank you! Your feedback has been submitted.";
            clear();
            loadTestimonials();
        }

        void loadTestimonials()
        {
            getcon();
            SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 10 PatientName, Message FROM Testimonials ORDER BY CreatedDate DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptTestimonials.DataSource = dt;
            rptTestimonials.DataBind();
        }
    }
}

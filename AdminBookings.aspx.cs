using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital
{
    public partial class AdminBookings : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings(string search = "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT BookingID, PatientName, Email, Mobile, Doctor, AppointmentDate, Message, CreatedDate FROM Bookings";

                if (!string.IsNullOrEmpty(search))
                {
                    query += " WHERE PatientName LIKE @Search OR Doctor LIKE @Search";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(search))
                    cmd.Parameters.AddWithValue("@Search", "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                lblMsg.Text = dt.Rows.Count == 0 ? "No bookings found." : "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadBookings(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadBookings();
        }

        protected void GridView1_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadBookings(txtSearch.Text.Trim());
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Bookings WHERE BookingID=@BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadBookings();
            lblMsg.Text = "Booking deleted successfully.";
        }
    }
}

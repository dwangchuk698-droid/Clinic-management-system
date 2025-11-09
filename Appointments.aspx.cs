using Hospital;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hospital
{
    public partial class AdminAppointment : System.Web.UI.Page
    {
        // connection string name must match web.config
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppointments();
            }
        }

        private void BindAppointments()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                // Simple SELECT to fetch appointments
                string q = "SELECT AppointmentID, PatientName, DoctorName, AppointmentDate, TimeSlot, Status FROM Appointments ORDER BY AppointmentDate, TimeSlot";
                using (SqlDataAdapter da = new SqlDataAdapter(q, con))
                {
                    da.Fill(dt);
                }
            }

           
        }

        protected void gvAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                // get id from CommandArgument
                int id;
                if (!Int32.TryParse(e.CommandArgument.ToString(), out id))
                {
                    // invalid id
                    return;
                }

                string status = e.CommandName == "Approve" ? "Approved" : "Rejected";

                using (SqlConnection con = new SqlConnection(cs))
                {
                    // WARNING: direct string concatenation (vulnerable to SQL injection).
                    // You requested '+value+' style concatenation, so query is built here as string.
                    string query = "UPDATE Appointments SET Status = '" + status.Replace("'", "''") + "' WHERE AppointmentID = " + id;

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // refresh grid
                BindAppointments();
            }
        }
    }
}

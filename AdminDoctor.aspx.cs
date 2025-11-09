using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital
{
    public partial class AdminDoctor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
            }
        }

        private void LoadDoctors()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT DISTINCT Doctor FROM Bookings", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "Doctor";
            ddlDoctor.DataValueField = "Doctor";
            ddlDoctor.DataBind();
            ddlDoctor.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Doctor --", ""));
        }

        private void LoadAppointments(string doctor)
        {
            if (string.IsNullOrEmpty(doctor)) return;

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Bookings WHERE Doctor=@Doctor ORDER BY AppointmentDate ASC", con);
            da.SelectCommand.Parameters.AddWithValue("@Doctor", doctor);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt.Rows.Count == 0)
                lblMsg.Text = "No appointments found for this doctor.";
            else
                lblMsg.Text = "";
        }

        protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAppointments(ddlDoctor.SelectedValue);
        }

        protected void GridView1_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadAppointments(ddlDoctor.SelectedValue);
        }
    }
}

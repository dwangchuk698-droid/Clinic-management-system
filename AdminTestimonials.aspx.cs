using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital
{
    public partial class AdminTestimonials : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTestimonials();
            }
        }

        private void LoadTestimonials(string search = "")
        {
            SqlCommand cmd;
            if (string.IsNullOrEmpty(search))
            {
                cmd = new SqlCommand("SELECT * FROM Testimonials ORDER BY CreatedDate DESC", con);
            }
            else
            {
                cmd = new SqlCommand("SELECT * FROM Testimonials WHERE PatientName LIKE @search ORDER BY CreatedDate DESC", con);
                cmd.Parameters.AddWithValue("@search", "%" + search + "%");
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMsg.Text = dt.Rows.Count == 0 ? "No testimonials found." : "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadTestimonials(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadTestimonials();
        }

        protected void GridView1_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadTestimonials(txtSearch.Text.Trim());
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("DELETE FROM Testimonials WHERE TestimonialID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadTestimonials();
            lblMsg.Text = "Testimonial deleted successfully.";
        }
    }
}

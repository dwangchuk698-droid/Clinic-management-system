using System;
using System.Web;
using System.Web.UI;

namespace Hospital
{
    public partial class DashboardAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Prevent direct access without login

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("WebForm1.aspx");
        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDetails.aspx");
        }

        protected void btnBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookings.aspx");
        }

        protected void btnContacts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminContacts.aspx");
        }

        protected void btnTestimonials_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminTestimonials.aspx");
        }
    }
}

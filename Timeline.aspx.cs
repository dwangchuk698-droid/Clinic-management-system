using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Timeline : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTimeline();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void loadTimeline()
        {
            getcon();
            SqlDataAdapter da = new SqlDataAdapter("SELECT Title, Description, EventDate FROM TimelineEvents ORDER BY EventDate ASC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptTimeline.DataSource = dt;
            rptTimeline.DataBind();
        }
    }
}

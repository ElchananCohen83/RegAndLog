using System;

namespace dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserRole"] != null)
                {
                    string role = Session["UserRole"].ToString();

                    if (!string.IsNullOrEmpty(role))
                    {
                        Label.Text = $"Hello {role}";
                    }
                }
                else
                {
                    Response.Redirect("/default.aspx");
                }
            }
        }
    }
}

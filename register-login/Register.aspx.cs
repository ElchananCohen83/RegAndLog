using System;
using System.Web.Configuration;

namespace register_user
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstname.Text;
            string lastName = txtLastname.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match. Please try again.";
                lblMessage.CssClass = "error-message";
                return;
            }

            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);


            bool registrationSuccess = DatabaseUtility.InsertUserToDatabase(firstName, lastName, email, hashedPassword);

            if (registrationSuccess)
            {
                lblMessage.Text = "Registration successful!";
                lblMessage.CssClass = "success-message";
                Response.Redirect("/default.aspx");

            }
            else
            {
                lblMessage.Text = "Registration failed. Please try again later.";
                lblMessage.CssClass = "error-message";
            }
        }
    }
}
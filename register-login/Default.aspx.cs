using System;
using System.Web.UI;

namespace login_user
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Add any initialization code here
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            // Get user input
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            int loginKey = DatabaseUtility.ValidateLogin(email, password);

            if (loginKey > 0)
            {
                txtKey.Visible = true;
                btnValidateKey.Visible = true;
                LabelKey.Visible = true;
                LabelKey.Text = loginKey.ToString();
            }
            else
            {
                // Failed login
                lblMessage.Text = "Invalid email or password. Please try again.";
            }
        }

        protected void BtnValidateKey_Click(object sender, EventArgs e)
        {
            // Get the user input from the TextBox
            int userInputKey = Convert.ToInt32(txtKey.Text);
            string email = txtEmail.Text.Trim();

            bool validKey = DatabaseUtility.ValidateKeyFromDatabase(userInputKey, email);

            if (validKey)
            {
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                // Invalid key, provide feedback to the user
                lblMessage.Text = "Invalid key. Please try again.";
                // Optionally, you might want to clear the TextBox or take other actions.
            }
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
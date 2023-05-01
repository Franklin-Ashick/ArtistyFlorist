using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistyFlorist
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = UsernameTextBox.Text;
                string password = PasswordTextBox.Text;

                // validate user input
                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    string script = "alert('Please fill in all fields.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                    return;
                }

                // check if the username and password are correct
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password", conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Username", username);
                        checkCmd.Parameters.AddWithValue("@Password", password);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count > 0)
                        {
                            // username and password are correct, set session variable and redirect to home page
                            Session["Username"] = username;
                            Response.Redirect("Shop.aspx");
                        }
                        else
                        {
                            // username or password is incorrect, show error message
                            string script = "alert('Invalid username or password.');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                        }
                    }
                }
            }
        }
    }
}
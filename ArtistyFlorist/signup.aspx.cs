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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string name = NameTextBox.Text;
                string username = UsernameTextBox.Text;
                string password = PasswordTextBox.Text;
                string address = AddressTextBox.Text;
                string phoneNumber = PhoneNumberTextBox.Text;
                string email = EmailTextBox.Text;

                // check if username already exists in the database
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username = @Username", conn);
                checkCmd.Parameters.AddWithValue("@Username", username);
                int count = (int)checkCmd.ExecuteScalar();
                conn.Close();

                if (count > 0)
                {
                    string script = "alert('Username already exists. Please choose a different username.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                

                // username already exists, show error message
            }
            else
                {
                    // insert data into database
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Users (Name, Username, Password, Address, PhoneNumber, Email) VALUES (@Name, @Username, @Password, @Address, @PhoneNumber, @Email)", conn);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("Login.aspx"); // redirect to login page
                }
            }

        }
       
    }
}
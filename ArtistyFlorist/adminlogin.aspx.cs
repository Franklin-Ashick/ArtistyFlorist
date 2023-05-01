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
    public partial class adminlogin : System.Web.UI.Page
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

               
                
                   
                     
                    
                        
                        if (username =="Admin" && password=="111")
                        {
                            // username and password are correct, set session variable and redirect to home page
                       
                            Response.Redirect("Admin/Dashboard.aspx");
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
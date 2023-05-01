using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistyFlorist.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStringg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection connectiong = new SqlConnection(connectionStringg);
            int rowCount = 0;
            using (SqlConnection connection = new SqlConnection(connectionStringg))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT COUNT(*) FROM OrderHistory ", connection);
                rowCount = (int)command.ExecuteScalar();
            }
            int rowCountt = 0;
            using (SqlConnection connection = new SqlConnection(connectionStringg))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT COUNT(*) FROM Users ", connection);
                rowCountt = (int)command.ExecuteScalar();
            }
            connectiong.Open();

            // Execute a SQL query to retrieve all records from the Billing table
            string queryg = "SELECT * FROM OrderHistory";
            SqlCommand commandg = new SqlCommand(queryg, connectiong);
            SqlDataReader readerg = commandg.ExecuteReader();

            decimal totalAmount = 0; // Initialize the total amount to 0
            decimal tA = 0;
           
            // Loop through the records and display them in the HTML table
            while (readerg.Read())
            {
                // Retrieve the total amount for the current record and add it to the running total
                decimal recordTotal;
                decimal.TryParse(readerg["totalPrice"].ToString(), out recordTotal);
                totalAmount += recordTotal;
                decimal ed;
                decimal.TryParse(readerg["totalQuantities"].ToString(), out ed);
                tA += ed;



                // ... the rest of the loop code to display the table rows ...
            }

            int tb = (int)(totalAmount * (80/100));
            // Store the total amount in a label
            Label1.Text = totalAmount.ToString();
            Label2.Text = tA.ToString();
            Label3.Text= rowCount.ToString();
            Label4.Text = rowCountt.ToString();
            // Close the connection and dispose of the resources
            readerg.Close();
            commandg.Dispose();
            connectiong.Close();
            connectiong.Dispose();



            string billingIDString = Request.QueryString["billingID"];
            if (!string.IsNullOrEmpty(billingIDString))
            {
                int billingID = int.Parse(billingIDString);
                // rest of the code


                // Connect to the database and execute a SQL command to delete the record with the specified BillingID value
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string query = "DELETE FROM Billing WHERE BillingID = @BillingID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BillingID", billingID);
                command.ExecuteNonQuery();

                // Close the connection and redirect back to the admin dashboard page
                connection.Close();
                Response.Redirect("admindash.aspx");
            }
            else
            {

                // handle the error or redirect to another page
            }

        }
    }
}
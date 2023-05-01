<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="deleteCartItem.aspx.cs" Inherits="ArtistyFlorist.deleteCartItem" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the id parameter is present in the request
        if (!String.IsNullOrEmpty(Request.Params["id"]))
        {
            // Retrieve the id parameter from the request
            string id = Request.Params["id"];

            // Create a connection to the database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Define the SQL query to delete the cart item
                string sqlQuery = "DELETE FROM Cart WHERE CartItemId = @id";

                // Create a command object with the SQL query and connection
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    // Add the id parameter to the command
                    command.Parameters.AddWithValue("@id", id);

                    // Execute the command to delete the cart item
                    command.ExecuteNonQuery();
                }
            }

            // Return a success response to the client
            Response.StatusCode = 200;
            Response.Write("Cart item deleted successfully.");
        }
        else
        {
            // Return an error response to the client
            Response.StatusCode = 400;
            Response.Write("Missing or invalid id parameter.");
        }

        // End the response
        Response.End();
    }

</script>
</asp:Content>

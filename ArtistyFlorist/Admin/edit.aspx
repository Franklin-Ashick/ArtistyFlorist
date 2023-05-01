<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ArtistyFlorist.Admin.edit" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <% 
        // Get the billingID parameter from the query string
        int billingID = int.Parse(Request.QueryString["loginID"]);

        // Connect to the database
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        // Execute a SQL query to retrieve the record to be edited
        string query = "SELECT * FROM Users WHERE UserID = @H_Id";
        SqlCommand command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("@H_Id", billingID);
        SqlDataReader reader = command.ExecuteReader();

        // Check if a record was found
        if (reader.Read())
        {
            // Get the values of the fields to be edited
            string Name = (string)reader["Name"];
            string Username = (string)reader["Username"];
               string Password = (string)reader["Password"];
            string Address = (string)reader["Address"];
               string PhoneNumber = (string)reader["PhoneNumber"];
            string Email = (string)reader["Email"];

            // Display a form with the fields to be edited
            %>
            <form method="post">
                <label>Name:</label>
                <input type="text" name="Name" value="<%= Name %>" /><br /><br />
                <label>Username:</label>
                <input type="text" name="Username" value="<%= Username %>" /><br /><br />
                 <label>Password:</label>
                <input type="text" name="Password" value="<%= Password %>" /><br /><br />
                <label>Address:</label>
                <input type="text" name="Address" value="<%= Address %>" /><br /><br />
                 <label>Phone Number:</label>
                <input type="text" name="PhoneNumber" value="<%= PhoneNumber %>" /><br /><br />
                <label>Email:</label>
                <input type="text" name="Email" value="<%= Email %>" /><br /><br />
                <input type="submit" value="Update" />
            </form>
            <%
                    reader.Close();
        }
        else
        {
            // Display an error message if a record was not found
            Response.Write("Record not found.");
        }

        // Close the connection and dispose of the resources
        reader.Close();
        connection.Close();
        reader.Dispose();
        command.Dispose();
        connection.Dispose();
    %>
    <br />
    <a href="Dashboard.aspx">Back to List</a>
<%
    // Check if the form was submitted
    if (Request.HttpMethod == "POST")
    {
        // Get the values of the fields from the form
         string Name = Request.Form["Name"];
            string Username = Request.Form["Username"];
               string Password = Request.Form["Password"];
            string Address = Request.Form["Address"];
               string PhoneNumber = Request.Form["PhoneNumber"];
            string Email = Request.Form["Email"];

        // Connect to the database
        SqlConnection connection2 = new SqlConnection(connectionString);
        connection2.Open();

        // Execute a SQL query to update the record
        string query2 = "UPDATE Users SET Name = @Name,Username= @Username,Password= @Password,Address= @Address,PhoneNumber= @PhoneNumber,Email= @Email WHERE UserID = @H_Id";
        SqlCommand command2 = new SqlCommand(query2, connection2);
        command2.Parameters.AddWithValue("@Name", Name);
        command2.Parameters.AddWithValue("@Username", Username);
           command2.Parameters.AddWithValue("@Password", Password);
           command2.Parameters.AddWithValue("@Address", Address);
            command2.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
        command2.Parameters.AddWithValue("@Email", Email);
        command2.Parameters.AddWithValue("@H_Id", billingID);
        int result = command2.ExecuteNonQuery();

        // Display a message indicating whether the update was successful
        if (result > 0)
        {
            Response.Write("<p>Record updated successfully.</p>");
        }
        else
        {
            Response.Write("<p>Record not updated.</p>");
        }

        // Close the connection and dispose of the resources
        connection2.Close();
        command2.Dispose();
        connection2.Dispose();
    }
%>
</asp:Content>

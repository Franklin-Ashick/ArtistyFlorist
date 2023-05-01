<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="ArtistyFlorist.Admin.delete" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%
    // Get the loginID parameter from the query string
    int loginID = Convert.ToInt32(Request.QueryString["loginID"]);
    
    // Connect to the database
    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
    SqlConnection connection = new SqlConnection(connectionString);
    connection.Open();
    
    // Execute a SQL query to delete the corresponding record from the Login table
    string query = "DELETE FROM Users WHERE UserID=@loginID";
    SqlCommand command = new SqlCommand(query, connection);
    command.Parameters.AddWithValue("@loginID", loginID);
    command.ExecuteNonQuery();
     Response.Redirect("Dashboard.aspx");
    // Close the connection and dispose of the resources
    command.Dispose();
    connection.Close();
    connection.Dispose();
    %>
</asp:Content>

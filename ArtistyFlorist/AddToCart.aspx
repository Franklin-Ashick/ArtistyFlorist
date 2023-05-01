<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="ArtistyFlorist.AddToCart" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
    string title = Request.Form["title"];
    string price = Request.Form["price"];
    string image = Request.Form["image"];
    int quantity = Convert.ToInt32(Request.Form["quantity"]);
    decimal totalPrice = Convert.ToDecimal(Request.Form["totalPrice"]);

    // Insert the cart item into the database
    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
    using (SqlConnection con = new SqlConnection(connectionString))
    {
        string query = "INSERT INTO Cart (Title, Price, Quantity, TotalPrice, Image) VALUES (@Title, @Price, @Quantity, @TotalPrice, @Image)";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@TotalPrice", totalPrice);
                cmd.Parameters.AddWithValue("@Image", image);
            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected == 1)
            {
                Response.Write("Item added to cart!");
            }
            else
            {
                Response.Write("Error adding item to cart.");
            }
        }
    }
%>
</asp:Content>

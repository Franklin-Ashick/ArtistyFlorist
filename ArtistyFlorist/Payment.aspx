<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ArtistyFlorist.Payment" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="breadcrumb-section set-bg" data-setbg="img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">

            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">

                            <%
                                string firstName = "";
                                string username = "";
                                string address = "";
                                string phone = "";
                                string email = "";
                                string un = "111";
                                // Retrieve data from the database
                                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                                using (SqlConnection connection = new SqlConnection(connectionString))
                                {
                                    connection.Open();

                                    string sqlQuery = "SELECT Name, Username, Address, PhoneNumber, Email FROM Users WHERE Username = @username";
                                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                                    {
                                        command.Parameters.AddWithValue("@username", Session["Username"]);
                                        //command.Parameters.AddWithValue("@username", un);
                                        using (SqlDataReader reader = command.ExecuteReader())
                                        {
                                            if (reader.Read())
                                            {
                                                firstName = reader.GetString(0);
                                                username = reader.GetString(1);
                                                address = reader.GetString(2);
                                                phone = reader.GetString(3);
                                                email = reader.GetString(4);
                                                Session["Adress"] = address;
                                                 Session["Email"] = email;
                                            }
                                        }
                                    }
                                }
                            %>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" value="<%= firstName %>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Username<span>*</span></p>
                                        <input type="text" value="<%= username %>">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add" value="<%= address %>">
                            </div>


                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" value="<%= phone %>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="<%= email %>">
                                    </div>
                                </div>
                            </div>





                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <% 
                                        // Retrieve cart items from the database
                                        using (SqlConnection connection = new SqlConnection(connectionString))
                                        {
                                            connection.Open();

                                            string sqlQuery = "SELECT Title, TotalPrice FROM Cart";
                                            using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                                            {
                                                using (SqlDataReader reader = command.ExecuteReader())
                                                {
                                                    while (reader.Read())
                                                    {
                                                        string title = reader.GetString(0);
                                                        decimal totalPricee = reader.GetDecimal(1);

                                    %>
                                    <li><%= title %> <span>₹<%= totalPricee %></span></li>
                                    <%
                                                    }
                                                }
                                            }
                                        }
                                    %>
                                </ul>
                                <% 
                                    // Calculate and display the total price of all cart items
                                    decimal totalPrice = 0;
                                    using (SqlConnection connection = new SqlConnection(connectionString))
                                    {
                                        connection.Open();

                                        string sqlQuery = "SELECT SUM(TotalPrice) FROM Cart";
                                        using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                                        {
                                            object result = command.ExecuteScalar();
                                            if (result != null && result != DBNull.Value)
                                            {
                                                totalPrice = Convert.ToDecimal(result);
                                                Session["Total"] = totalPrice;
                                            }
                                        }
                                    }
                                %>
                                <div class="checkout__order__total">Total <span>₹<%= totalPrice %></span></div>
                                 <a href="Recipt.aspx" class="primary-btn">PLACE ORDER</a>
                           
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</asp:Content>

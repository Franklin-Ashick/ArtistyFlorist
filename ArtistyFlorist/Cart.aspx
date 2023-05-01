<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtistyFlorist.Cart" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="breadcrumb-section set-bg" data-setbg="img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%             int subtotal = 0;
                                    decimal total = 0;
                                    // Create a connection to the database
                                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                                    using (SqlConnection connection = new SqlConnection(connectionString))
                                    {
                                        // Open the database connection
                                        connection.Open();

                                        // Define the SQL query to retrieve cart items
                                        string sqlQuery = "SELECT CartItemId, Title, Price, Quantity, TotalPrice, Image FROM Cart";

                                        // Create a command object with the SQL query and connection
                                        using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                                        {
                                            // Execute the query and get a data reader
                                            using (SqlDataReader reader = command.ExecuteReader())
                                            {
                                                // Initialize subtotal and total to 0


                                                // Iterate through the data reader and populate the table rows
                                                while (reader.Read())
                                                {
                                                    int id = reader.GetInt32(0);
                                                    string title = reader.GetString(1);
                                                    decimal price = reader.GetDecimal(2);
                                                    int quantity = reader.GetInt32(3);
                                                    decimal totalPrice = reader.GetDecimal(4);
                                                    string image = reader.GetString(5);

                                                    // Add the item's total price to the subtotal and total
                                                    subtotal += quantity;
                                                    total += totalPrice;
                                                    
                                                    Session["TotalQuantity"] = subtotal;

                                %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%= image %>" style="max-width: 100px; height: auto;" alt="">
                                        <h5><%= title %></h5>
                                    </td>
                                    <td class="shoping__cart__price">₹<%= price %>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="<%= quantity %>">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">₹<%= totalPrice %>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <button type="button" onclick="deleteCartItem(<%= id %>)" class="btn btn-danger">X</button>
                                    </td>
                                </tr>
                                <% 
                                                }
                                            }
                                        }
                                    }

                                    // Output the subtotal and total in the HTML
                                %>
                          
                            </tbody>
                        </table>
                              <script>
                                  function deleteCartItem(id) {
                                      if (confirm("Are you sure you want to remove this item from your cart?")) {
                                          $.ajax({
                                              type: "POST",
                                              url:
                                                  "deleteCartItem.aspx",
                                              data: { id: id },
                                              success: function () {
                                                  location.reload();
                                              },
                                              error: function () {
                                                  alert("An error occurred while deleting the item.");
                                              }
                                          });
                                      }
                                  }
                              </script>                 </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <a href="Shop.aspx" class="primary-btn">CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>

                            <li>Total: <span>₹<%= total %></span></li>
                        </ul>
                        <a href="Payment.aspx" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

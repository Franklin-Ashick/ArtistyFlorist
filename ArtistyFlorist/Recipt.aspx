<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Recipt.aspx.cs" Inherits="ArtistyFlorist.Recipt" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {// Retrieve order information from query string or session
   
            if (!IsPostBack)
            { 
               Label2.Text = Session["Total"].ToString();
            }
        }
</script>
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
                            <span>Recipt</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="order_details section-margin--small">
        <div class="container">
           
            <p class="text-center billing-alert">Thank you. Your order has been received.</p>
             <div class="text-right">
               <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" class="btn btn-danger" Text="Exit"   />
                 </div>
            <div id="printContent">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h3 class="billing-title">Order Info</h3>
                            <table class="order-rable">
                                <tr>
                                    <td>Order number</td>
                                    <td>: <%= new Random().Next(10000, 99999) %></td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td>: <%= DateTime.Now.ToString("yyyy-MM-dd") %></td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td>: ₹<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Payment method</td>
                                    <td>:
                                        <asp:Label ID="paym" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h3 class="billing-title">Customer Details</h3>
                            <table class="order-rable">
                                  <%
                                      string firstName = "";
                                      string username = "";
                                      string address = "";
                                      string phone = "";
                                      string email = "";
                                      string un = "111";
                                      // Retrieve data from the database
                                      string connectionStringg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                                      using (SqlConnection connectiong = new SqlConnection(connectionStringg))
                                      {
                                          connectiong.Open();

                                          string sqlQueryg = "SELECT Name, Username, Address, PhoneNumber, Email FROM Users WHERE Username = @username";
                                          using (SqlCommand commandg = new SqlCommand(sqlQueryg, connectiong))
                                          {
                                              //command.Parameters.AddWithValue("@username", Session["Username"]);
                                              commandg.Parameters.AddWithValue("@username", un);
                                              using (SqlDataReader readerg = commandg.ExecuteReader())
                                              {
                                                  if (readerg.Read())
                                                  {
                                                      firstName = readerg.GetString(0);
                                                      username = readerg.GetString(1);
                                                      address = readerg.GetString(2);
                                                      Session["Address"] = address;
                                                      phone = readerg.GetString(3);
                                                      email = readerg.GetString(4);
                            %>
                          
                                <tr>
                                    <td>Name</td>
                                    <td>:
                                        <%= firstName %></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>:
                                        <%= email %></td>
                                </tr>
                                <tr>
                                    <td>Ph Number</td>
                                    <td>:
                                        <%= phone %></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>:
                                        <%= address %></td>
                                </tr>
                                       <% 
                                                    }
                                                }
                                            }
                                        }

                                        // Output the subtotal and total in the HTML
                                    %>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="shoping__checkout">
                        <h2>Order Details</h2>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>

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
                                                        

                                    %>
                                    <tr>
                                        <td>
                                            <img src="<%= image %>" style="max-width: 100px; height: auto;" alt="">
                                            <h5><%= title %></h5>
                                        </td>
                                        <td>₹<%= price %>
                                        </td>
                                        <td>
                                            <h5><%= quantity %></h5>



                                        </td>
                                        <td>₹<%= totalPrice %>
                                        </td>

                                    </tr>
                                    <% 
                                                    }
                                                }
                                            }
                                        }

                                        // Output the subtotal and total in the HTML
                                    %>


                                    <tr>
                                        <td>
                                            <h4></h4>
                                        </td>
                                        <td>
                                            <h5>Total</h5>
                                        </td>
                                        <td>
                                            <h4><span>₹<%= total %></span></h4>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <asp:Button ID="pay" runat="server" class="primary-btn" Text="Print Recipt"  OnClientClick="printContent()" />

            </div>
        </div>
    </section>
    <!--================End Order Details Area =================-->
    <script>
        function printContent() {
            var printDiv = document.getElementById("printContent");
            var printContents = printDiv.innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;

        }
    </script>
</asp:Content>

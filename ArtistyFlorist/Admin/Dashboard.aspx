<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ArtistyFlorist.Admin.Dashboard" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-lg-8 mb-4 order-0">
                <div class="card">
                    <div class="d-flex align-items-end row">
                        <div class="col-sm-7">
                            <div class="card-body">
                                <h5 class="card-title text-primary">Congratulations Admin 🎉</h5>
                                <p class="mb-4">
                                    You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                            your profile.
                         
                                </p>


                            </div>
                        </div>
                        <div class="col-sm-5 text-center text-sm-left">
                            <div class="card-body pb-0 px-0 px-md-4">
                                <img
                                    src="assets/img/illustrations/man-with-laptop-light.png"
                                    height="140"
                                    alt="View Badge User"
                                    data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                    data-app-light-img="illustrations/man-with-laptop-light.png" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 order-1">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img
                                            src="assets/img/icons/unicons/chart-success.png"
                                            alt="chart success"
                                            class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button
                                            class="btn p-0"
                                            type="button"
                                            id="cardOpt3"
                                            data-bs-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>

                                    </div>
                                </div>
                                <span class="fw-semibold d-block mb-1">Total</span>
                                <h3 class="card-title mb-2">₹<asp:Label ID="Label1" runat="server" Text="total"></asp:Label></h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i>+72.80%</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img
                                            src="assets/img/icons/unicons/wallet-info.png"
                                            alt="Credit Card"
                                            class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button
                                            class="btn p-0"
                                            type="button"
                                            id="cardOpt6"
                                            data-bs-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>

                                    </div>
                                </div>
                                <span>Quantities</span>
                                <h3 class="card-title text-nowrap mb-1">
                                    <asp:Label ID="Label2" runat="server" Text="total"></asp:Label></h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i>+28.42%</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Total Revenue -->
            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                <div class="card">
                    <div class="row row-bordered g-0">
                        <div class="col-md-12">
                            <h5 class="card-header m-0 me-2 pb-6">Login Details</h5>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Action</th>
                                            <th>Login ID</th>
                                            <th>Username</th>
                                            <th>Password</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            // Connect to the database
                                            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                                            SqlConnection connection = new SqlConnection(connectionString);
                                            connection.Open();

                                            // Execute a SQL query to retrieve all records from the Billing table
                                            string query = "SELECT * FROM Users";
                                            SqlCommand command = new SqlCommand(query, connection);
                                            SqlDataReader reader = command.ExecuteReader();

                                            // Loop through the records and display them in the HTML table
                                            while (reader.Read())
                                            {
                                                int LoginID = (int)reader["UserID"];

                                                string username = (string)reader["Username"];
                                                string password = (string)reader["Password"];




                                        %>
                                        <tr>
                                            <td><a href="delete.aspx?loginID=<%= LoginID %>">Delete</a></td>
                                            <!-- New column -->
                                            <td><%= LoginID %></td>

                                            <td><%= username %></td>
                                            <td><%= password %></td>


                                        </tr>
                                        <%
                                            }

                                            // Close the connection and dispose of the resources
                                            reader.Close();
                                            connection.Close();
                                            reader.Dispose();
                                            command.Dispose();
                                            connection.Dispose();
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--/ Total Revenue -->
            <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                <div class="row">
                    <div class="col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img src="assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button
                                            class="btn p-0"
                                            type="button"
                                            id="cardOpt4"
                                            data-bs-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>

                                    </div>
                                </div>
                                <span class="d-block mb-1">Total Orders</span>
                                <h3 class="card-title text-nowrap mb-2">
                                    <asp:Label ID="Label3" runat="server" Text="total"></asp:Label></h3>
                                <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i>14.82%</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <i class="bx bx-user me-2" alt="Credit Card" class="rounded"></i>
                                    </div>
                                    <div class="dropdown">
                                        <button
                                            class="btn p-0"
                                            type="button"
                                            id="cardOpt1"
                                            data-bs-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                        </div>
                                    </div>
                                </div>
                                <span class="fw-semibold d-block mb-1">Number OF Users</span>
                                <h3 class="card-title mb-2">
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i>+28.14%</small>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>

        <div class="card">
            <h5 class="card-header">User List</h5>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Login ID</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Address</th>
                            <th>PH Number</th>
                            <th>Emaik</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        <% 
                            // Connect to the database
                            string connectionStringg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                            SqlConnection connectiong = new SqlConnection(connectionStringg);
                            connectiong.Open();

                            // Execute a SQL query to retrieve all records from the Billing table
                            string queryg = "SELECT * FROM Users";
                            SqlCommand commandg = new SqlCommand(queryg, connectiong);
                            SqlDataReader readerg = commandg.ExecuteReader();

                            // Loop through the records and display them in the HTML table
                            while (readerg.Read())
                            {
                                int LoginID = (int)readerg["UserID"];
                                string name = (string)readerg["Name"];
                                string username = (string)readerg["Username"];
                                string Address = (string)readerg["Address"];
                                string PhoneNumber = (string)readerg["PhoneNumber"];
                                string Email = (string)readerg["Email"];




                        %>
                        <tr>

                            <!-- New column -->
                            <td><%= LoginID %></td>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong><%= name %></strong></td>
                            <td><%= username %></td>
                            <td><%= Address %></td>
                            <td><%= PhoneNumber %></td>
                            <td><%= Email %></td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="edit.aspx?loginID=<%= LoginID %>"><i class="bx bx-edit-alt me-1"></i>Edit</a>
                                        <a class="dropdown-item" href="delete.aspx?loginID=<%= LoginID %>"><i class="bx bx-trash me-1"></i>Delete</a>
                                    </div>
                                </div>







                            </td>
                        </tr>
                        <%
                            }

                            // Close the connection and dispose of the resources
                            reader.Close();
                            connection.Close();
                            reader.Dispose();
                            command.Dispose();
                            connection.Dispose();
                        %>
                    </tbody>
                </table>
            </div>
        </div>
               <hr class="my-5" />

              <!-- Bootstrap Table with Header - Footer -->
              <div class="card">
                <h5 class="card-header">Order History</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Action</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Quantities</th>
                        <th>Price</th>
                        <th>Date - Time</th>
                        <th>Address</th>
                      </tr>
                    </thead>
                    <tbody>
                           <% 
                            // Connect to the database
                            string connectionStringgg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                            SqlConnection connectiongg = new SqlConnection(connectionStringgg);
                            connectiongg.Open();

                            // Execute a SQL query to retrieve all records from the Billing table
                            string querygg = "SELECT * FROM OrderHistory";
                            SqlCommand commandgg = new SqlCommand(querygg, connectiongg);
                            SqlDataReader readergg = commandgg.ExecuteReader();

                            // Loop through the records and display them in the HTML table
                            while (readergg.Read())
                            {
                                int LoginID = (int)readergg["id"];
                                string uname = (string)readergg["username"];
                                string email = (string)readergg["email"];
                                int tq = (int)readergg["totalQuantities"];
                                 decimal tp = Convert.ToDecimal(readergg["totalPrice"]);
                                DateTime date = (DateTime)readergg["date"];
                                string add = (string)readergg["address"];




                        %>
                        <tr>

                            <!-- New column -->
                             <td><a href="delete3.aspx?loginID=<%= LoginID %>">Delete</a></td>
                             <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= uname %></strong></td>
                            <td><%= email %></td>
                            <td><%= tq %></td>
                            <td><%= tp %></td>
                            <td><%= date %></td>
                            <td><%= add %></td>
                            
                        </tr>
                        <%
                            }

                            // Close the connection and dispose of the resources
                            reader.Close();
                            connection.Close();
                            reader.Dispose();
                            command.Dispose();
                            connection.Dispose();
                        %>
                    
                    
                    </tbody>
                    <tfoot class="table-border-bottom-0">
                      <tr>
                        <th>Action</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Quantities</th>
                        <th>Price</th>
                        <th>Date - Time</th>
                        <th>Address</th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
         
    </div>
</asp:Content>

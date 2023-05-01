<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ArtistyFlorist.Admin.products" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Admin /</span>Products
        </h4>

        <div class="row">
            <div class="col-md-12">
                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                        <a class="nav-link " href="Add.aspx"><i class="bx bx-user me-1"></i>Add Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-bell me-1"></i>View Products</a>
                    </li>

                </ul>
                <div class="card mb-4">
         

                    <hr class="my-0" />
        <div class="card">
                <h5 class="card-header">Product Details</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-dark">
                    <thead>
                      <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Category</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                          <%            
                                    // Create a connection to the database
                                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                                    using (SqlConnection connection = new SqlConnection(connectionString))
                                    {
                                        // Open the database connection
                                        connection.Open();

                                        // Define the SQL query to retrieve cart items
                                        string sqlQuery = "SELECT ProductID, Title, Price, Image, Category FROM Products";

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
                                                    string image = reader.GetString(3);
                                                    string category = reader.GetString(4);
                                                   

                                                    // Add the item's total price to the subtotal and total
                                                    

                                %>
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= title %></strong></td>
                        <td><%= price %></td>
                        <td>
                         
 <img src="../<%= image %>" style="max-width: 100px; height: 100px;" alt="">
                       
                        </td>
                        <td><span class="badge bg-label-primary me-1"><%= category %></span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="edit1.aspx?productId=<%= id %>"
                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
                              >
                              <a class="dropdown-item" href="delete1.aspx?loginID=<%= id %>"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
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
                </div>
              </div>


            </div>
            </div>
        </div>
      </div>

  
</asp:Content>

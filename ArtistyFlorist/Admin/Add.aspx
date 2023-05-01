<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="ArtistyFlorist.Admin.Add" %>

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
                        <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>Add Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="products.aspx"><i class="bx bx-bell me-1"></i>View Products</a>
                    </li>

                </ul>
                <div class="card mb-4">
                    <h5 class="card-header">Add Product</h5>
                    <!-- Account -->

                    <hr class="my-0" />
                    <div class="card-body">
                        <form method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label for="txtTitle" class="form-label">Title:</label>
                                    <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                  <div class="mb-3 col-md-6">
                                    <label for="txtPrice" class="form-label">Price:</label>
                                    <asp:TextBox ID="txtPrice" step="0.01" min="0" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                 <div class="mb-3 col-md-12">
                                    <label for="fuImage" class="form-label">Image:</label>
                                    <asp:FileUpload ID="fuImage" class="form-control" runat="server" />
                                </div>
                                <div>
                                    <label for="ddlCategory" class="form-label">Category:</label>
                                    <asp:DropDownList ID="ddlCategory" class="select2 form-select" runat="server">
                                        <asp:ListItem>Flowers</asp:ListItem>
                                        <asp:ListItem>Plants</asp:ListItem>
                                        <asp:ListItem>Tools</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 <div class="mt-2">
                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary me-2" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                        </form>
                                 </div>
                </div>
            </div>
        </div>
     </div>
    </div>
</asp:Content>

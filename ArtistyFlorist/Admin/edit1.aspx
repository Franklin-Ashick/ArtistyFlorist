<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="edit1.aspx.cs" Inherits="ArtistyFlorist.Admin.edit1" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container-xxl flex-grow-1 container-p-y">
  <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Admin /</span>Products</h4>
  <div class="row">
    <div class="col-md-12">
      <div class="card mb-4">
        <h5 class="card-header">Edit Product</h5>
        <!-- Account -->
        <hr class="my-0" />
        <div class="card-body">
          <form method="POST" enctype="multipart/form-data">
            <div class="row">
               
              <div class="mb-3 col-md-6">
                <label for="txtTitle" class="form-label">Title:</label>
                <asp:TextBox ID="txtTitle" class="form-control" runat="server" ></asp:TextBox>
              </div>
              <div class="mb-3 col-md-6">
                <label for="txtPrice" class="form-label">Price:</label>
                <asp:TextBox ID="txtPrice" step="0.01" min="0" class="form-control"   runat="server"></asp:TextBox>
              </div>
              <div class="mb-3 col-md-12">
                <label for="fuImage" class="form-label">Image:</label>
                <asp:FileUpload ID="fuImage" class="form-control" runat="server" />
                <asp:Image ID="imgProduct" runat="server" CssClass="mt-2" Width="100"   />
              </div>
              <div>
                <label for="ddlCategory" class="form-label">Category:</label>
                <asp:DropDownList ID="ddlCategory" class="select2 form-select" SelectionMode="Single"  runat="server">
                <asp:ListItem Text="Flowers" Value="Flowers" />
   <asp:ListItem Text="Plants" Value="Plants" />
   <asp:ListItem Text="Tools" Value="Tools" />
                </asp:DropDownList>
              </div>
              <div class="mt-2">
                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary me-2" Text="Submit" OnClick="btnSubmit_Click" />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
    </div>
</asp:Content>

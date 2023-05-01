using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ArtistyFlorist.Admin
{
    public partial class edit1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            



            int productId = Convert.ToInt32(Request.QueryString["productId"]);
            // Retrieve data from the database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT Title, Price, Image, Category FROM Products WHERE ProductId = @ProductId";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", productId);
                    //command.Parameters.AddWithValue("@username", un);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string title = reader.GetString(0);
                            decimal price = reader.GetDecimal(1);
                            string image = reader.GetString(2);
                            string category = reader.GetString(3);
                            ddlCategory.Items.FindByValue(category).Selected = true;
                            txtPrice.Text = price.ToString();
                            txtTitle.Text = title;
                            imgProduct.ImageUrl = "../" +image;
                        }
                    }
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve the product ID from the query string
            int productId = Convert.ToInt32(Request.QueryString["productId"]);

            // Retrieve the new product data from the form fields
            string title = txtTitle.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text);
            string category = ddlCategory.SelectedValue;

            // If a new image was uploaded, save it to the server and update the image URL in the database
            string imageUrl = imgProduct.ImageUrl;
            if (fuImage.HasFile)
            {
                string fileName = Path.GetFileName(fuImage.FileName);
                string filePath = Server.MapPath("Images/" + fileName);
                fuImage.SaveAs(filePath);
                imageUrl = "Admin/Images/" + fileName;
            }

            // Update the product data in the database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "UPDATE Products SET Title = @Title, Price = @Price, Image = @Image, Category = @Category WHERE ProductId = @ProductId";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Image", imageUrl);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.ExecuteNonQuery();
                }
            }

            // Redirect the user back to the product list page
            Response.Redirect("products.aspx");
        }
    }
}

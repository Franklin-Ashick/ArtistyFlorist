using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace ArtistyFlorist.Admin
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            decimal price = decimal.Parse(txtPrice.Text);
            string category = ddlCategory.SelectedValue;
            string imageName = "";

            if (fuImage.HasFile)
            {
                // Save the image to the "Images" folder within the project
                string fileName = Path.GetFileName(fuImage.FileName);
                string filePath = Server.MapPath("Images/" + fileName);
                fuImage.SaveAs(filePath);

                imageName = "Admin/Images/" + fileName;
            }
            //string imagePath = null;
            //if (fuImage.HasFile)
            //{
            //    string filename = Path.GetFileNameWithoutExtension(fuImage.FileName);
            //    string extension = Path.GetExtension(fuImage.FileName);
            //    filename = $"{filename}_{DateTime.Now.ToString("yyyyMMddHHmmssfff")}{extension}";
            //    string folderPath = Server.MapPath("~Images/");
            //    if (!Directory.Exists(folderPath))
            //    {
            //        Directory.CreateDirectory(folderPath);
            //    }
            //    string filePath = folderPath + filename;
            //    fuImage.SaveAs(filePath);
            //    imagePath = "Images/" + filename;
            //}
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var command = new SqlCommand("INSERT INTO Products (Title, Price, Image, Category) VALUES (@Title, @Price, @Image, @Category)", connection))
                {
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Image", imageName);
                    command.Parameters.AddWithValue("@Category", category);
                    command.ExecuteNonQuery();
                }
            }
            Response.Write("<div class='alert alert-success'>Product added successfully!</div>");
        }
    }
}
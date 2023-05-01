using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ArtistyFlorist
{
    public partial class Recipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pay_Click(object sender, EventArgs e)
        {




        }

        protected void pay_Click1(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string username = Session["Username"].ToString();
            string address = Session["Address"].ToString();
            string email = Session["Email"].ToString();
            int totalQuantity = (int)Session["TotalQuantity"];
            decimal totalPrice = (decimal)Session["Total"];
            DateTime date = DateTime.Now;

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "INSERT INTO OrderHistory (username, email, totalQuantities, totalPrice, date, address) VALUES (@username, @email, @totalQuantities, @totalPrice, @date, @address)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@totalQuantities", totalQuantity);
                        cmd.Parameters.AddWithValue("@totalPrice", totalPrice);
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@address", address);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            SqlCommand cmd2 = new SqlCommand("DELETE FROM Cart", con);
                            cmd2.ExecuteNonQuery();
                           
                            con.Close();
                            Session.Abandon();
                            Response.Redirect("Homepage.aspx");
                        }
                        else
                        {
                            con.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
    

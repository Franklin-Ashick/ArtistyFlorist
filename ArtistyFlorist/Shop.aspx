<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="ArtistyFlorist.Shop" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="breadcrumb-section set-bg" data-setbg="img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping</h2>
                        <div class="breadcrumb__option">
                            <a href="Homepage.aspx">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Flower Arrangements</a></li>
                                <li><a href="#">Indoor Plants</a></li>
                                <li><a href="#">Outdoor Plants</a></li>
                                <li><a href="#">Flower Bouquets</a></li>
                                <li><a href="#">Artificial Plants</a></li>
                                <li><a href="#">Planters & Pots</a></li>
                                <li><a href="#">Gardening Tools</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>

                       

                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Spring Sale</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="img/product/discount/Pothos.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Indoor Plants</span>
                                            <h5><a href="#">Pothos</a></h5>
                                            <div class="product__item__price">250.00 <span>310.25</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="img/product/discount/Tulips.jpg">
                                            <div class="product__discount__percent">-15%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Flowers</span>
                                            <h5><a href="#">Tulip Bouquet</a></h5>
                                            <div class="product__item__price">200.00 <span>230.50</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="img/product/discount/Snake.jpg">
                                            <div class="product__discount__percent">-25%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Indoor Plants</span>
                                            <h5><a href="#">Snake Plant</a></h5>
                                            <div class="product__item__price">150.00 <span>200.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="img/product/discount/rose.jpg">
                                            <div class="product__discount__percent">-25%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Flowers</span>
                                            <h5><a href="#">Rose</a></h5>
                                            <div class="product__item__price">150.00 <span>200.00</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>












                </div>
            </div>
        </div>
    </section>
    <section class="featured spad">
        <div class="container">
           
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>All Products</h2>
                    </div>
                  
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".flowers">Flowers</li>
                            <li data-filter=".plants">Plants</li>
                            <li data-filter=".tools">Tools</li>
                        </ul>
                    </div>

                    <div class="row featured__filter">
                        <% 
                            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(connectionString))
                            {
                                string query = "SELECT * FROM Products";
                                using (SqlCommand cmd = new SqlCommand(query, con))
                                {
                                    con.Open();
                                    using (SqlDataReader reader = cmd.ExecuteReader())
                                    {
                                        while (reader.Read())
                                        {
                                            string title = reader["Title"].ToString();
                                            string price = reader["Price"].ToString();
                                            string image = reader["Image"].ToString();
                                            string category = reader["Category"].ToString().ToLower().Replace(" ", "-");
                        %>
                        <div class="col-lg-4 col-md-6 mix <%= category %>">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="<%= image %>">
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                           <li><a href="#" onclick="addToCart('<%= title %>', '<%= price %>','<%= image %>')"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="#"><%= title %></a></h6>
                                    <h5><%= price %></h5>
                                </div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                    </div>
                     
                    <script>
                        $(document).ready(function () {
                            $(".featured__controls ul li").click(function () {
                                var filter = $(this).attr("data-filter");
                                $(".featured__filter").find(".mix").hide();
                                if (filter == "*") {
                                    $(".featured__filter").find(".mix").show();
                                }
                                else {
                                    $(".featured__filter").find(filter).show();
                                }
                                $(this).addClass("active").siblings().removeClass("active");
                            });
                        });

                        function addToCart(title, price,image) {
                            var quantity = prompt("Enter the quantity:");
                            console.log('addToCart() function called.');
                            if (quantity !== null) {
                                var cartItem = {
                                    title: title,
                                    price: price,
                                    image: image,
                                    quantity: quantity,
                                    totalPrice: price * quantity // calculate total price based on quantity
                                };

                                var cartItems = JSON.parse(localStorage.getItem("cart")) || [];
                                cartItems.push(cartItem);
                                localStorage.setItem("cart", JSON.stringify(cartItems));

                                // send cart item to server-side for storage
                                $.ajax({
                                    url: "AddToCart.aspx",
                                    method: "POST",
                                    data: {
                                        title: title,
                                        price: price,
                                        image: image,
                                        quantity: quantity,
                                        totalPrice: cartItem.totalPrice
                                    },
                                    success: function (response) {
                                        alert(response);
                                    }
                                });

                                alert("Item added to cart!");
                            }
                        }
                    </script>
                     <div class="shoping__checkout">
                     <a href="Cart.aspx" class="primary-btn">Cart</a>
                </div>
                </div>
                  
                </div>
            </div>
    </section>
</asp:Content>

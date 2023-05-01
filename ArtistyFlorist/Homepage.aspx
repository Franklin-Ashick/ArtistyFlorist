<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="ArtistyFlorist.Homepage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="Login.aspx">Flower Arrangements</a></li>
                            <li><a href="Login.aspx">Indoor Plants</a></li>
                            <li><a href="Login.aspx">Outdoor Plants</a></li>
                            <li><a href="Login.aspx">Flower Bouquets</a></li>
                            <li><a href="Login.aspx">Artificial Plants</a></li>
                            <li><a href="Login.aspx">Planters & Pots</a></li>
                            <li><a href="Login.aspx">Gardening Tools</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">

                    <div class="hero__item set-bg" data-setbg="img/hero/flowers.jpg">
                        <div class="hero__text">
                            <span>Beautiful Flowers</span>
                            <h2>Make Your Home
                                <br />
                                Bloom</h2>
                            <p>Shop Our Selection of Fresh Flowers and Plants</p>
                            <a href="Login.aspx" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/rose.jpg">
                            <h5><a href="Login.aspx">Roses</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/tulips.jpg">
                            <h5><a href="Login.aspx">Tulips</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/Daisies.jpg">
                            <h5><a href="Login.aspx">Daisies</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/Indoor.jpg">
                            <h5><a href="Login.aspx">Indoor Plants</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/Succulents.jpg">
                            <h5><a href="Login.aspx">Succulents</a></h5>
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
                        <h2>Featured Products</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".flowers">Flowers</li>
                            <li data-filter=".plants">Plants</li>
                            <li data-filter=".tools">Tools</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-4 col-md-6 mix flowers">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/rose.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Roses</a></h6>
                            <h5>250.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix plants">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/ferns.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Ferns</a></h6>
                            <h5>200.00</h5>
                        </div>
                    </div>
                </div> 
                <div class="col-lg-4 col-md-6 mix tools">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Shears.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Garden Shears</a></h6>
                            <h5>250.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix flowers">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Tulips.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Tulips</a></h6>
                            <h5>150.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix plants">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Snake.jpg">
                            <ul
                                class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Snake Plant</a></h6>
                            <h5>300.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix flowers">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Daisies.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Daisies</a></h6>
                            <h5>180.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix plants">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Pothos.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Pothos</a></h6>
                            <h5>250.00</h5>
                        </div>
                    </div>
                </div>
              

                <div class="col-lg-4 col-md-6 mix tools">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Can.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Watering Can</a></h6>
                            <h5>350.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mix tools">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/Rake.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="Login.aspx"><i class="fa fa-heart"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="Login.aspx"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="Login.aspx">Garden Rake</a></h6>
                            <h5>200.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>

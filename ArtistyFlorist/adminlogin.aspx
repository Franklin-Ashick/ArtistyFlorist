<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="adminlogin.aspx.cs" Inherits="ArtistyFlorist.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                background: #4CAF50;
                width: 100%;
                border: 0;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="breadcrumb-section set-bg" data-setbg="img/bread.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Login</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="login-page">
        <div class="form">

            <div class="container">
                <form class="login-form" action="#">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <label for="UsernameTextBox">Username</label>
                            <asp:TextBox ID="UsernameTextBox" placeholder="Enter your username" required runat="server"></asp:TextBox>
                           
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="PasswordTextBox">Password</label>
                             <asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>
                          
                        </div>
                        <div class="col-lg-12 text-center">

                            <button type="submit" onclick="login()" class="site-btn">Login</button>
                            <script>
                                function login() {
                                    var username = document.getElementById("UsernameTextBox").value;
                                    var password = document.getElementById("PasswordTextBox").value;

                                    // Validate user input
                                    if (username == "" || password == "") {
                                        alert("Please fill in all fields.");
                                        return;
                                    }

                                    // Make an AJAX request to the server to login the user
                                    var xhr = new XMLHttpRequest();
                                    xhr.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {
                                            if (this.responseText == "success") {
                                                // Redirect to the home page if login is successful
                                                window.location.href = "Admin/Dashboard.aspx";
                                            } else {
                                                // Display an error message if login fails
                                                alert("Invalid username or password.");
                                            }
                                        }
                                    };
                                    xhr.open("POST", "Login.aspx", true);
                                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    xhr.send("username=" + username + "&password=" + password);
                                }
                            </script>
                        </div>
                        <p class="message">Not registered? <a href="signup.aspx">Create an account</a></p>


                    </div>
                    <p class="message"><a href="adminlogin.aspx">Admin Login</a></p>
                </form>
            </div>

        </div>
    </div>
</asp:Content>

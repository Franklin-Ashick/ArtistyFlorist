<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="ArtistyFlorist.signup" %>

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
                <form class="registration-form" action="#">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Registration Form</h2>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="NameTextBox">Name</label>
                            <asp:TextBox runat="server" ID="NameTextBox" TextMode="SingleLine" placeholder="Enter your name" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="UsernameTextBox">Username</label>
                            <asp:TextBox runat="server" ID="UsernameTextBox" TextMode="SingleLine" placeholder="Enter your username" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="PasswordTextBox">Password</label>
                            <asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="ConfirmPasswordTextBox">Confirm Password</label>
                            <asp:TextBox runat="server" ID="ConfirmPasswordTextBox" TextMode="Password" placeholder="Confirm your password" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="AddressTextBox">Address</label>
                            <asp:TextBox runat="server" ID="AddressTextBox" TextMode="SingleLine" placeholder="Enter your address" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="PhoneNumberTextBox">Phone Number</label>
                            <asp:TextBox runat="server" ID="PhoneNumberTextBox" TextMode="SingleLine" placeholder="Enter your phone number" required ></asp:TextBox>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <label for="EmailTextBox">Email</label>
                            <asp:TextBox runat="server" ID="EmailTextBox" TextMode="SingleLine" placeholder="Enter your email" required></asp:TextBox>
                        </div>
                        <div class="col-lg-12 text-center">
                            <button type="submit" class="site-btn" onclick="registerUser()">Register</button>

                            <script>
                                function registerUser() {
                                    var name = document.getElementById("NameTextBox").value;
                                    var username = document.getElementById("UsernameTextBox").value;
                                    var password = document.getElementById("PasswordTextBox").value;
                                    var address = document.getElementById("AddressTextBox").value;
                                    var phoneNumber = document.getElementById("PhoneNumberTextBox").value;
                                    var email = document.getElementById("EmailTextBox").value;

                                    // Validate user input
                                    if (name == "" || username == "" || password == "" || address == "" || phoneNumber == "" || email == "") {
                                        alert("Please fill in all fields.");
                                        return;
                                    }

                                    // Make an AJAX request to the server to register the user
                                    var xhr = new XMLHttpRequest();
                                    xhr.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {
                                            if (this.responseText == "success") {
                                                // Redirect to the login page if registration is successful
                                                window.location.href = "Login.aspx";
                                            } else {
                                                // Display an error message if registration fails
                                                alert("Failed to register user.");
                                            }
                                        }
                                    };
                                    xhr.open("POST", "RegisterUser.aspx", true);
                                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    xhr.send("name=" + name + "&username=" + username + "&password=" + password + "&address=" + address + "&phoneNumber=" + phoneNumber + "&email=" + email);
                                }
                            </script>
                        </div>
                        <div class="col-lg-12 text-center">
                            <p class="message">Already registered? <a href="Login.aspx">Login here</a></p>
                        </div>
                    </div>
                </form>
            </div>


        </div>
    </div>
</asp:Content>

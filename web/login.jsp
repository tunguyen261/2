<%-- 
    Document   : login
    Created on : Feb 21, 2022, 4:06:16 PM
    Author     : Nguyễn Đoàn Tú
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/login.css">
    </head>
    <body>
        <main>
            <div class="row">
                <div class="colm-form">
                    <div class="form-container">
                        <form action="MainController" method="POST" id="check">
                            <input type="text" name="userID" required="" placeholder="Login name">
                            <input type="password" name="password" required="" placeholder="Password">

                            <div class="g-recaptcha" data-sitekey="6Ldydr4eAAAAAJ9RMmCmfAXeSWttS_p1KKrUcVkH"></div>
                            <div id="error"></div>
                            <input class="btn-login" type="submit" name="action" value="Login"/>
                        </form>
                        <%
                            String error = (String) request.getAttribute("ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <%= error%>
                        
                    </div>
                </div>
            </div>
        </main>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const recap = document.getElementById("check");
                const error = document.getElementById("error");
                recap.addEventListener("submit", function (event) {

                    const response = grecaptcha.getResponse();
                    if (response) {
                        recap.submit();
                    } else {
                        event.preventDefault();
                        error.innerHTML = "Please check";
                    }
                });
            }
        </script>
    </body>
</html>

<%-- 
    Document   : cart
    Created on : Feb 22, 2022, 9:46:11 PM
    Author     : Nguyễn Đoàn Tú
--%>

<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Cart</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">

    </head>
    <body>

        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">
                            <!-- logo -->
                            <div class="site-logo">
                                <a href="home.jsp">
                                    <img src="assets/img/logo1.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <nav class="main-menu">
                                <ul>
                                    <li class="current-list-item"><a href="home.jsp">Home</a></li>
                                    <li><a href="#">Pages</a>
                                        <ul class="sub-menu">
                                            <li><a href="MainController?action=Load">Shop</a></li>
                                            <li><a href="cart.jsp">Cart</a></li>
                                            <li><a href="checkout.jsp">Check Out</a></li>
                                        </ul>
                                    </li>
                                    <%
                                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                        if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                                            response.sendRedirect("login.jsp");
                                            return;
                                        }
                                        String search = request.getParameter("search");
                                        if (search == null) {
                                            search = "";
                                        }
                                    %>
                                    <li><a href="account.jsp">Welcome: <%= loginUser.getFullName()%></a></li>
                                    <li><a href="MainController?action=Logout">Log out</a></li>
                                    <li>
                                        <div class="header-icons">
                                            <a class="shopping-cart" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
                                            <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->

        <!-- search area -->
        <div class="search-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <span class="close-btn"><i class="fas fa-window-close"></i></span>
                        <div class="search-bar">
                            <div class="search-bar-tablecell">
                                <h3>Search For:</h3>
                                <form action="MainController">
                                    <input type="text" name="searchByUser" placeholder="Keywords">
                                    <button type="submit" name="action" value="Search">Search <i class="fas fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end search arewa -->

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Fresh and Organic</p>
                            <h1>Cart</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {

        %>
        <!-- cart -->
        <div class="cart-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="cart-table-wrap">
                            <table class="cart-table">
                                <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove"></th>
                                        <th class="product-image">Product Image</th>
                                        <th class="product-name">Name</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        double total = 0;
                                        for (Product product : cart.getCart().values()) {
                                            total += product.getPrice() * product.getQuantity();
                                    %>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                                    <tr class="table-body-row">
                                        <td class="product-remove"><a href="MainController?action=Remove&productID=<%= product.getProductID()%>"><i class="far fa-window-close"></i></a></td>
                                        <td class="product-image"><img src="<%= product.getImage()%>" alt=""></td>
                                        <td class="product-name"><%= product.getProductName()%></td>
                                        <td class="product-price">$<%= product.getPrice()%></td>
                                        <td class="product-quantity"><input min="0" type="number" name="quantity" value="<%=product.getQuantity()%>" placeholder="0"></td>
                                        <td class="product-total"><%= product.getPrice() * product.getQuantity()%>$</td>
                                        <td><input type="submit" name="action" value="Edit" class="boxed-btn"/></td>
                                    </tr>
                                </form>
                                <%
                                    }
                                %> 
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="total-section">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data">
                                        <td><strong>Total: </strong></td>
                                        <td>$<%= total%></td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>
                <div class="cart-buttons">
                    <a href="MainController?action=Load" class="boxed-btn black">Shop</a>
                    <a href="MainController?action=Checkout" class="boxed-btn black">Check Out</a>
                </div>
            </div>
        </div>

        <!-- end cart -->

        <!-- footer -->
        <div class="footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box about-widget">
                            <h2 class="widget-title">About us</h2>
                            <p>Founded by VegaTu, Freshworld ventured in to a ‘farm-to-home’ concept by organizing fruits and vegetables retailing through a street vendor by using battery operated carts.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box get-in-touch">
                            <h2 class="widget-title">Get in Touch</h2>
                            <ul>
                                <li>FPTU HCM </li>
                                <li>support@VegaTu.com</li>
                                <li>+00 111 222 3333</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box pages">
                            <h2 class="widget-title">Pages</h2>
                            <ul>
                                <li><a href="home.jsp">Home</a></li>
                                <li><a href="MainController?action=Load">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box subscribe">
                            <h2 class="widget-title">Subscribe</h2>
                            <p>Subscribe to our mailing list to get the latest updates.</p>
                            <form action="home.jsp">
                                <input type="email" placeholder="Email">
                                <button type="submit"><i class="fas fa-paper-plane"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end footer -->

        <!-- copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <a>Share with your friends:</a>
                    </div>
                    <div class="col-lg-6 text-right col-md-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end copyright -->

        <!-- jquery -->
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="assets/js/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="assets/js/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="assets/js/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="assets/js/sticker.js"></script>
        <!-- main js -->
        <script src="assets/js/main.js"></script>

    </body>
</html>

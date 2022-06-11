<%-- 
    Document   : home
    Created on : Feb 21, 2022, 3:59:44 PM
    Author     : Nguyễn Đoàn Tú
--%>

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
        <title>VegaTu</title>
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

                            <!-- menu start -->
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
                                    <li><a >Welcome: <%= loginUser.getFullName()%></a></li>
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
                                    <form action="MainController">
                                        <input type="text" name="searchByUser" placeholder="Keywords">
                                        <button type="submit" name="action" value="Search">Search <i class="fas fa-search"></i></button>
                                    </form>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end search area -->

        <!-- hero area -->
        <div class="hero-area hero-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 offset-lg-2 text-center">
                        <div class="hero-text">
                            <div class="hero-text-tablecell">
                                <p class="subtitle">Fresh & Organic</p>
                                <h1>Delicious Seasonal Vegatable & Fruit</h1>
                                <div class="hero-btns">

                                    <a href="MainController?action=Load" class="bordered-btn">SHOPPING NOW</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end hero area -->

        <!-- features list section -->
        <div class="list-section pt-80 pb-80">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="content">
                                <h3>Free Shipping</h3>
                                <p>When order over $75</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-phone-volume"></i>
                            </div>
                            <div class="content">
                                <h3>24/7 Support</h3>
                                <p>Get support all day</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="list-box d-flex justify-content-start align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-sync"></i>
                            </div>
                            <div class="content">
                                <h3>Refund</h3>
                                <p>Get refund within 3 days!</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end features list section -->

        <!-- product section -->
        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">	
                            <h3><span class="orange-text">Some</span> Products</h3>
                            <p>Melon, Watermelon, Grape, Apple, Onion, Carrot,...</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a><img src="assets/img/products/duahau.jpg" alt=""></a>
                            </div>
                            <h3>WaterMelon</h3>

                            <a href="MainController?action=Load" class="cart-btn"><i class="fas fa-shopping-cart"></i>See more in shop</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a><img src="assets/img/products/nho.jpg" alt=""></a>
                            </div>
                            <h3>Grape</h3>

                            <a href="MainController?action=Load" class="cart-btn"><i class="fas fa-shopping-cart"></i>See more in shop</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a><img src="assets/img/products/hanhtay.jpg" alt=""></a>
                            </div>
                            <h3>Onion</h3>

                            <a href="MainController?action=Load" class="cart-btn"><i class="fas fa-shopping-cart"></i>See more in shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end product section -->


        <!-- advertisement section -->
        <div class="abt-section mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <img src="assets/img/logo1.png" alt="">
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-text">
                            <p class="top-sub">Since Year 2022</p>
                            <h2>We are <span class="orange-text">VegaTu</span></h2>
                            <p>Food and vegetable retailing startup, Fresh world has raised an undisclosed amount in funding from IAN investor Nagaraja Prakasam and Infosys co-founder Kris Gopalakrishnan. As a part of the deal, Prakasam joined the board of Freshworld.</p>
                            <p>Founded by VegaTu, Fresh world ventured in to a ‘farm-to-home’ concept by organizing fruits and vegetables retailing through a street vendor by using battery operated carts. Each cart uses a tablet, printer and communication technologies to provide track inventory, receipt and analyze data.</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end advertisement section -->

        <!-- shop banner -->
        <section class="shop-banner">
            <div class="container">
                <h3>The new product is on! <br> with high <span class="orange-text">QUALITY...</span></h3>
                <div class="sale-percent"><span>Let's <br> Shopping</span>NOW <span></span></div>
                <a href="MainController?action=Load" class="cart-btn btn-lg">Shop</a>
            </div>
        </section>

        <!-- end shop banner -->

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

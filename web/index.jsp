<%-- 
    Document   : index
    Created on : 8 Jul, 2021, 1:44:30 PM
    Author     : Aish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Index</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">
        
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <!--<meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />-->

        <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,600i,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        
        
    </head>
    <body>
        <div class="fh5co-loader"></div>

        <div id="page">
            <%@include file="header.jsp"%>

            <header id="fh5co-header" class="fh5co-cover js-fullheight" role="banner" data-stellar-background-ratio="0.5">
                <video autoplay muted loop id="myVideo">
                    <source src="video/bg.mp4" type="video/mp4">
                </video>
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="display-t js-fullheight">
                                <div class="display-tc js-fullheight animate-box" data-animate-effect="fadeIn">
                                    <h1>The BestSeller Coffee Shop in Davangere</h1>
                                    <br>
                                    <h2>Brought to you by  #TastyCoffee</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <div id="fh5co-about" class="fh5co-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8  animate-box">
                            <div class="section-heading">
                                <h2 style="font-size: 40px;">BESTSELLERS</h2>
                                <p style="font-size: 28px;">You can pick these up blindly. Our all-time customer favorites.</p>
                                <p><a href="product.jsp?product=roasted" style="width: 200px; " class="btn btn-primary btn-outline">VIEW PRODUCT</a></p>
                            </div>
                        </div>
                        <div class="col-md-4" data-animate-effect="fadeInRight">
                            <img src="image/roasted.jfif" alt="No image">
                        </div>

                    </div>
                </div>
            </div>

            <div id="fh5co-featured-menu" class="fh5co-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 fh5co-heading animate-box">
                            <center><h2 style="font-size: 40px;">SHOP NOW</h2></center>
                        </div>

                        <div class="col-md-4">
                            <div class="fh5co-item">
                                <img src="image/instant3.jpg" class="img-responsive" alt="No image" style="width: 320px; height: 300px;">
                                <center><h3>INSTANT COFFEE</h3>
                                    <br>
                                    <p><a href="product.jsp?product=instant" class="btn btn-primary btn-outline">SHOP</a></p></center>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="fh5co-item">
                                <center><img src="image/packed.jpg" class="img-responsive" alt="No image" style="width: 300px; height: 300px;"></center>
                                <center><h3>PACKED COFFEE</h3>
                                    <br>
                                    <p><a href="product.jsp?product=packed" class="btn btn-primary btn-outline">SHOP</a></p></center>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="fh5co-item">
                                <img src="image/decoction.jpg" class="img-responsive" alt="No image" style="width: 310px; height: 300px;">
                                <center><h3>COFFEE DECOCTION</h3>
                                    <br>
                                    <p><a href="product.jsp?product=decoction" class="btn btn-primary btn-outline">SHOP</a></p></center>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8  animate-box">
                        <div class="section-heading">
                            <h2 style="font-size: 40px;">EQUIPMENT TO BREW & <br> SERVE</h2>
                            <p style="font-size: 23px;">From the simple French Press to the Italian style Coffee Percolator, TastyCoffee's machinery and equipment are not heavy (on price and weight), very durable and easy to operate.
                                <br><br>Now everyone can enjoy great coffee at home, work or anyplace they desire.</p>
                            <br>
                            <p><a href="product.jsp?product=equipment" class="btn btn-primary btn-outline">SHOP</a></p>
                        </div>
                    </div>
                    <div class="col-md-3" data-animate-effect="fadeInRight">
                        <img src="image/equipment.jpg" alt="No image" style="width: 400px; height: 400px;">
                    </div>
                </div>
            </div>

            <div id="fh5co-slider" class="fh5co-section animate-box">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 animate-box">
                            <div class="fh5co-heading">
                                <h2 style="font-size: 40px;">TESTIMONY</h2>
                            </div>
                        </div>
                        <div class="col-md-6 col-md-push-1 animate-box">
                            <aside id="fh5co-slider-wrwap">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li style="background-image: url(image/person1.jpg);">
                                            <div class="overlay-gradient"></div>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg">
                                                        <div class="slider-text-inner">
                                                            <div class="desc">

                                                                <p style="font-size: 23px; color: white;">" However, with the TastyCoffee maybe a bit pricier than the others out there but trust me, this is worth every Rupee!
                                                                    This is a delicious, bitter sweet rich roast coffee with a smooth finish, and very low acidity.
                                                                    Overall this is a superb coffee!! I like this much better than the TastyCoffee pure coffee! "<br><br> - Dr.Komala
                                                                </p>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="background-image: url(image/person2.jpg);">
                                            <div class="overlay-gradient"></div>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg">
                                                        <div class="slider-text-inner">
                                                            <div class="desc">
                                                                <p style="font-size: 23px; color: white;">" Definitely better than Instant coffee available in the market, which I can't even drink now after having TastyCoffee everyday.
                                                                    For making a cup of coffee in my coffee machine, i add 2 heaped teaspoon of coffee with 300ml of water and 3teaspoon of milk powder and 1 teaspoon of sugar.

                                                                    I have placed a repeated order for Fresh Ground Coffee, which says a lot about the coffee! " <br><br> - Priya Chowdhery
                                                                </p>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="background-image: url(image/person3.jpg);">
                                            <div class="overlay-gradient"></div>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-12 col-md-offset-0 col-md-pull-10 slider-text slider-text-bg">
                                                        <div class="slider-text-inner">
                                                            <div class="desc">
                                                                <p style="font-size: 23px; color: white;">" I got this when there was a 1+1 offer. 1 KG of coffee lasted for almost 4 months when i used it with my coffee machine.
                                                                    This is a robust and strong flavoured coffee, so those preferring this flavour profile should definitely give this a try. especially at this price, 
                                                                    i would say it comes to be cheap (even without 1+1 offer). " <br><br> - Sunitha Shekhar

                                                                </p>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>		   	
                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="footer.jsp"%>
        </div>

        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>
</html>

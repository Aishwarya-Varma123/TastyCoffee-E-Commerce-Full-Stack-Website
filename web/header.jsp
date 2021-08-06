<%-- 
    Document   : header
    Created on : 9 Jul, 2021, 2:08:51 PM
    Author     : Aish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">

        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>

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
        <nav class="fh5co-nav" role="navigation" style="position: absolute;">

            <div class="container">

                <div class="row">
                    <div class="col-xs-12 text-center logo-wrap">
                        <div id="fh5co-logo"><a href="index.jsp">TastyCoffee<span>.</span></a></div>
                    </div>
                    <div class="col-xs-12 text-center menu-1 menu-wrap">
                        <ul>
                            <li class="active"><a href="index.jsp">Home</a></li>
                            
                            <li class="has-dropdown">
                                <a href="index.jsp" style="font-size: 15px; color: white;">Shop</a>
                                <ul class="dropdown" style="width: 200px;">
                                    <li><a href="product.jsp?product=packed">Packed Filter Coffee</a></li>
                                    <li><a href="product.jsp?product=instant">Instant Coffee</a></li>
                                    <li><a href="product.jsp?product=decoction">Filter Coffee Decoction</a></li>
                                    <li><a href="product.jsp?product=equipment">Coffee Equipment</a></li>
                                </ul>
                            </li>
                                           
                            <%if (session.getAttribute("uname") != null) {%>
                            <%if (session.getAttribute("id").equals(1)) {%>
                            <li class="has-dropdown">
                                <a href="index.jsp" style="font-size: 15px; color: white;"><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("uname")%></a>
                                <ul class="dropdown" style="width: 200px;">
                                    <li style="color:white;"><a href="adminusers.jsp">Manage Users</a></li>
                                    <li style="color:white;"><a href="adminproducts.jsp">Manage Products</a></li>
                                    <li style="color:white;"><a href="adminorders.jsp">Manage Order Details</a></li>
                                    <li style="color:white;"><a href="adminaddproducts.jsp">Add Products</a></li>
                                    <li style="color:white;"><a href="register?logout=yes">Logout</a></li>

                                </ul>
                            </li>
                            <%} else {%>
                            <li><a href="cart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 15px;"></i> <span style="color: white; font-size: 15px;">MyCart</span></a></li>
                            <li class="has-dropdown">
                                <a href="index.jsp" style="font-size: 15px; color: white;"><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("uname")%></a>
                                <ul class="dropdown" style="width: 150px;">
                                    
                                    <li style="color:white;"><a href="myorder.jsp">My Orders</a></li>
                                    <li style="color:white;"><a href="editprofile.jsp">Edit Profile</a></li>
                                    <li style="color:white;"><a href="register?logout=yes">Logout</a></li>
                                </ul>
                            </li>


                            <%}%>


                            <%} else {%>

                            <li><a href="login.jsp"><i class="fa fa-user-o" aria-hidden="true" style="font-size: 20px;"></i></a></li>
                                    <%}%>

                            <!--<li><a href="search.jsp"><i class="fa fa-search" aria-hidden="true" style="font-size: 20px;"></i></a></li>
                            -->
                        </ul>
                    </div>
                </div>

            </div>

        </nav>


    </body>
</html>

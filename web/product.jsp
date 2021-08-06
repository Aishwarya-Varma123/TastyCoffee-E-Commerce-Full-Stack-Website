<%-- 
    Document   : product
    Created on : 13 Jul, 2021, 12:21:44 PM
    Author     : Aish
--%>

<%@page import="model.cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Products</title>
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
        <%@include file="header.jsp"%> 
        <div class="header">
            <br><br><br><br><br><br>
            <div class="container">
                <%
                    registration s1 = new registration(session);
                    ArrayList<product> ar = s1.get_productinfo(request.getParameter("product"));
                    Iterator<product> itr = ar.iterator();
                    while (itr.hasNext()) {
                        product s = itr.next();
                %> 

                <form action="addtocart" method="POST">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8  animate-box">
                                <div class="section-heading">
                                    <h2 style="font-size: 40px; color: red;"><%=s.getP_name()%></h2>
                                    <input type="hidden" name="p_id" value="<%=s.getP_id()%>">
                                    <p style="font-size: 23px; color: white;"><%=s.getP_details()%></p>
                                    <!-- <p id="quantity" style="font-size: 26px; color: black; width: 40px;" > </p>-->
                                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="" style="color: red; font-size: 30px; width: 100px; height: 50px; padding: 10px;">
                                  
                                    <p class="price" style="font-size: 23px; color: white;" >&#8377; <%=s.getP_cost()%></p>
                                    <script>
                                        var tcost = document.getElementById("total").innerText;
                                        function total() {
                                            var total = parseInt(quantity * tcost);
                                            document.getElementById("total").innerText = total;
                                        }
                                    </script>
                                    <br>


                                    <button type="submit" name="addtocart" class="btn btn-primary"> Add to Cart </button>



                                </div>
                            </div>
                            <div class="col-md-3" data-animate-effect="fadeInRight">
                                <img src="image/<%=s.getP_image()%>" alt="No image" style="width: 400px; height: 400px;">
                            </div>
                        </div>
                    </div>
                    <br><br>
                </form>
                <%}%>

            </div>
        </div>
        <br><br>
        <%@include file="footer.jsp"%>  

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

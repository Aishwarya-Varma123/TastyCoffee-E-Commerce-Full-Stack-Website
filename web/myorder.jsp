<%-- 
    Document   : myorder
    Created on : 21 Jul, 2021, 7:14:27 PM
    Author     : Aish
--%>

<%@page import="model.cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.order"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Myorders</title>
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
        <style>
            
        </style>

    </head>
    <body>
        <%@include file="header.jsp"%> 

        <br><br><br><br><br><br>

        <br>

        <% if (session.getAttribute("uname") != null) {%>


        <h1 style="color: whitesmoke; text-align: center;  font-family: cursive;"><b>My Orders</b></h1>
        <br>
        <div class="container-xl" style="border: 3px solid white;">
                <table width="100%" style="text-align: center; height: 45px;">
                <thead>
                    <tr style="color: white; font-size: 27px; font-family: cursive;">
                        <th style="text-align: center; padding: 15px;">Image</th>
                        <th style="text-align: center;">Product Name</th>
                        <th style="text-align: center;">Product Cost</th>
                        <th style="text-align: center;">Quantity</th>
                        <th style="text-align: center;">Product Total</th>
                        <th style="text-align: center;">Ordered Date</th>
                    </tr>
                </thead>
                <br><br>
                <tbody>

                   <%
                        registration s1 = new registration(session);
                        ArrayList<order> ar = s1.getorderinfo();
                        Iterator<order> itr = ar.iterator();
                        while (itr.hasNext()) {
                            order s = itr.next();

                    %> 

                    <%  int tcost = 0, pcost = 0;
                        registration s2 = new registration(session);
                        ArrayList<order> ar1 = s2.getorderinfocart(s.getOid());
                        Iterator<order> itr1 = ar1.iterator();
                        while (itr1.hasNext()) {
                            order s3 = itr1.next();
                            pcost = (Integer.parseInt(s.getC_cost()) * Integer.parseInt(s.getQuantity()));
                            tcost = tcost + (Integer.parseInt(s.getC_cost()) * Integer.parseInt(s.getQuantity()));

                    %> 
                    
                    <tr>
                        <td style="padding: 15px;"><img src="image/<%=s3.getP_image()%>" style="width:100px; height: 100px;"></td>
                        <td style="color: whitesmoke; font-size: 23px;"><%=s3.getC_name()%></td>
                        <td style="color: whitesmoke; font-size: 23px;">Rs. <%=s3.getC_cost()%></td>
                        <td style="color: whitesmoke; font-size: 23px;"><%=s3.getQuantity()%></td>
                        <td style="color: whitesmoke; font-size: 23px;">Rs. <%=pcost%></td>
                        <td style="color: whitesmoke; font-size: 23px;"><%=s.getDate()%></td>
                        <%}%>
                    </tr>
                    <tr>
                    <!--    <td style="color: red; font-size: 23px;">Order ID:- <%=s.getOid()%></td> -->
                        <td>
                            <br><br>
                            <%if (s.getStatus().equals("ordered")) {%>
                            <form action="order" method="post">
                                <input type="hidden" name="orderid" value="<%=s.getOid()%>"/>
                                <input type="submit"  class="btn btn-primary btn-outline" name="deleteorder" value="Cancel Order">
                            </form>
                            <%}%>                           
                            <br><br>                            
                        </td>
                        
                        <td style="color: red; font-size: 23px;">Grand Total: Rs. <%=tcost%></td>
                        <td style="color: red; font-size: 23px;">Status: <%=s.getStatus()%></td>                
                    </tr>
                    
                    <tr><td></td><td></td></tr>                    
                <%}%><br>
                
                
                </tbody>
                
            </table>
                
        </div>



        <br>
        
        <br><br><br>
        <%}%>

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




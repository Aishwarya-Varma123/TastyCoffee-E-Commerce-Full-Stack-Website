
<%@page import="model.registration"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Cart</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

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
        <style>
            #quantity{
                width: 80px;
                color: black;

            }
            
            #msg{
                text-align: center;
                background: white;
                padding: 5px;
                width: 30%;
                color: red;
                font-weight: bold;
                font-size: 30px;
            }
            
            #total1{
                color: red;
            }
            
        </style>
        
        <%@include file="header.jsp"%> 
        <br><br><br><br><br>
        <div class="header">
            <div class="container">

            </div>

        </div>

        <br>

        <% if (session.getAttribute("uname") == null) {%>
        <br><br><br><br>
    <center><div id="msg">Please login to add the product into your cart.</div></center>
    <br><br><br><br><br><br><br><br>
        <%} else {%>
        
        <div class="container-xl">
            
            <div class="row">
                <div class="col-sm-4">
                    <h1 style="color: whitesmoke; text-align: center; font-family: cursive;"><b>Cart Products</b></h1>
                </div>
            </div>
            <hr>         
            <table width="95%" border="0" style="text-align: center; height: 45px;">
                <thead>
                    <tr style="color: white; font-size: 27px; font-family: cursive;">
                        
                        <th style="text-align: center; padding: 15px;">Image</th>
                        <th style="text-align: center;">Product Name</th>
                        <th style="text-align: center;">Product Cost</th>
                        <th style="text-align: center;">Quantity</th>
                        <th style="text-align: center;">Product Total</th>
                        <th style="text-align: center;">Delete</th>
                    </tr>
                </thead>
                <br><br>
                <tbody>
                    <%  int tcost = 0, pcost=0;
                        registration s1 = new registration(session);
                        ArrayList<cart> ar = s1.getcartinfo();
                        Iterator<cart> itr = ar.iterator();
                        while (itr.hasNext()) {
                            cart s = itr.next();
                            pcost = (Integer.parseInt(s.getC_cost()) * Integer.parseInt(s.getQuantity()));
                            tcost = tcost + (Integer.parseInt(s.getC_cost()) * Integer.parseInt(s.getQuantity()));
                            

                    %> 
                    <tr>
                        
                        <td style="padding: 15px;"><img src="image/<%=s.getC_image()%>" style="width:100px; height: 100px;"></td>
                        <td style="color: whitesmoke; font-size: 23px;"><%=s.getC_name()%></td>
                        <td style="color: whitesmoke; font-size: 23px;">Rs. <%=s.getC_cost()%></td>
                        <td style="color: whitesmoke; font-size: 23px;"><%=s.getQuantity()%></td>
                        <td style="color: whitesmoke; font-size: 23px;">Rs. <%=pcost%></td>
                        <td>
                            <form action="addtocart" method="post">
                                <input type="hidden" name="cid" value="<%=s.getC_id()%>"/>
                                <button type="submit" name="delete" class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i> </button>
                            </form>
                        </td>
                        
                </tr>
                
                    <%}%>
                </tbody>
            </table>

        </div>
        <br> 
        <hr>
        <br>
        <div>
            <center><p id="total" style="color: white; font-size: 27px; font-family: cursive; padding: 10px; border: 2px solid white; width: 350px;"><span id="total1">Grand Total:</span> Rs. <%=tcost%></p></center>

            <center><p><a href="booking.jsp" class="btn btn-primary btn-outline"> Buy now </a></p></center>
        </div>


        <br><br>

        

        <br><br>
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

<%-- 
    Document   : booking
    Created on : 21 Jul, 2021, 2:20:53 AM
    Author     : Aish
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.cart"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Shipping</title>
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
        <style>
            body{
                
                font-family: cursive;
                font-size: 17px;
            }


           /* .container{
                
                max-width: 1500px;
                margin:auto;
                padding-left: 25px;
                padding-right: 25px;
            }*/


            .selectpicker{
                /*color: #35475e;*/
                color:red;
                margin-left: 6px;
                font-size: 24px;
            }
            /*.table-responsive {
                margin: 30px 0;
            }*/
            .table-wrapper {
                /*background: #fff;*/
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: -5px;
                text-align: center;
                color: white;
                text-decoration: white underline;
                padding-left: 600px;
                padding-top: 80px;
                /*padding: 16px 30px;*/
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }



            /* Custom checkbox */
            .cost{
                float: left;
                font-size: 25px;
                color: black;
                padding-top: 30px;

            }

            .form-control {
                border-radius: 2px red;
                box-shadow: none;
                border-color: red;
            }
            textarea.form-control {
                resize: vertical;
            }
            
            form label {
                font-weight: normal;
            }





            .wrapp{
                max-width: 1200px;
                border-radius: 20px;
                margin: auto;
                background: rgba(0,0,0,0.1);
                box-sizing: border-box;
                padding: 0px;
                color: #555;
                font-size: 20px;
                margin-top: 100px;
                /*float: center;*/

            }

            h1{
                text-align: center; 
            }

            input[type=text],input[type=number]{
                width:99%;
                box-sizing: border-box;
                padding:12px 6px;
                
                background: rgba(0,0,0,0.10);
                outline: none;
                border:1px solid white;
                border-bottom: 3px double #fff;
                color: white;
                border-radius: 5px;
                margin:5px;
                font-weight: bold;
            }

            input[type=submit]{
                width: 20%;
                padding: 10px 0;
                margin-top: 30px;
            }
            
            .wrapp{
                border: 3px solid white;
                padding: 35px;
            }

        </style>

        <%@include file="header.jsp"%>
        
        <br><br><br>
        

<!-- from  <%{%> to <%}%> everything gets looped. -->
        <% if (session.getAttribute("uname") != null) {%>  <!-- checking whether the user is logged in or not. -->
        <div class="container-xl">
            <!--<div class="table-responsive">-->
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4">
                                <h1 style="color: white; text-decoration: red underline; font-size: 40px;"> <b>Billing Details</b></h1>
                            </div>
                        </div>
                    </div>  
                    <form action="order" method="POST">
                    <div class="wrapp">
                        <div style="font-size:30px; color: white;">  Buyer Name : <span style="color: red;"><%= session.getAttribute("uname")%></span></div>
                        
                        <%int tcost = 0; //global variable.
                          
                            registration s1 = new registration(session);
                            ArrayList<cart> ar = s1.getcartinfo();
                            Iterator<cart> itr = ar.iterator();
                            while (itr.hasNext()) {
                                cart s = itr.next();
                                
                                tcost = tcost + (Integer.parseInt(s.getC_cost()) * Integer.parseInt(s.getQuantity()));
                                
                                //since getC_cost() is in string converting it to Int type.
%>
                        

                        
                            
                            <%}%>
                            <div class="cost" style="font-size:30px; color: white;">
                                Total : <span style="color: red;">Rs. <%=tcost%></span>  <!-- 'tcost' comes from java code. -->
                            </div>
                            
                            <br><br><br>
                            <hr>
                            <br>
                            <p style="font-size:30px; color: white;">Payment Method : <select class="selectpicker" >
                                    <option>Cash on delivery</option>
                                    </select></p>
                            <br>
                            <h2 style="font-size:30px; color: white; text-decoration: red underline;"> Delivery Address</h2>
                            <input type="text" id="adr" name="address" placeholder="Complete address" reruired><br>
                            <input type="text" id="city" name="city" placeholder="Enter city" required><br>
                            <input type="text" id="state" name="state" placeholder="Enter state" required><br>
                            <input type="number" id="pincode" name="pincode" placeholder="Enter Pincode" required><br>
                            
                        
                    </div>
                            <br>
                            <center><input type="submit" name="submit" value="Confirm Order" id="btn" class="btn btn-primary btn-outline"><br></center>
                            <input type="hidden" name="tcost" value="<%=tcost%>">
                            <input type="hidden" name="email" value="<%=session.getAttribute("email")%>">
                    </form>
                </div>
            <!--</div>-->
        </div>
        <%}%>
        <br><br><br>

        
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

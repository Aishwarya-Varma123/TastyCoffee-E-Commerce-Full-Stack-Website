<%-- 
    Document   : editprofile
    Created on : 28 Jul, 2021, 2:09:01 AM
    Author     : Aish
--%>

<%@page import="model.user"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | EditProfile</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


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
            input[type=text],input[type=number]{
                border-color: black;
                color: black;
                padding-left: 40px;
                
            }
            
            input[type=submit]{
                width: 25%;
               
            }
            
            label{
                color: black;
                padding-left: 43px;
                font-size: 22px;
                font-family: "Satisfy", cursive;
            }
            
            
            
            .status{
                text-align: center;
                background: white;
                padding: 5px;
                width: 30%;
                color: red;
                font-weight: bold;
                font-size: 23px;
            }

        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br><br><br><br><br>
        <% if (request.getAttribute("status") != null) {%>
    <center> <div class="status"><%=request.getAttribute("status")%></div> </center>
        <%}%>
    <br>

    <% if (session.getAttribute("uname") != null) {
            registration reg = new registration(session);
            user s = reg.getInfo();
    %>

    <br><center><h1 style="color:red; font-size: 42px;"><b>Edit Profile</b></h1></center>
    <br>
    <form action="register" method="POST" class="frm">
        <div class="container">
            <div class="jumbotron">
                <label>Name</label>
                <input type="text" class="form-control" name="name" value="<%=s.getName()%>"/>
                <br>
                <label>Phone Number</label>
                <input type="number" class="form-control" name="pno" value="<%=s.getPhone()%>"/>
                <br>
            </div>
                <center><button type="submit" class="btn btn-primary btn-outline" name="update">Update</button></center>

        </div>

    </form>
    <%}%>

    <br><br><br><br><br>

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

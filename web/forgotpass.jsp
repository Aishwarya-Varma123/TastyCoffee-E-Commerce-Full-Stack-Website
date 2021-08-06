<%-- 
    Document   : forgotpass
    Created on : 27 Jul, 2021, 8:28:17 PM
    Author     : Aish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | ForgotPassword</title>
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
        
        
    </head>
    <body>
        <style>
            
            .status{
                text-align: center;
                background: white;
                padding: 5px;
                width: 30%;
                color: red;
                font-weight: bold;
                font-size: 23px;
            }
            
            #forgot{
                border: 4px solid white;
                padding: 30px;
                padding-bottom: 60px;
            }
            
            .error{
                color: red;
                font-size: 23px;
            }
            
            
        </style>
        
        <script>
            $.validator.addMethod('email', function(value) {
               return /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/.test(value);
            }, 'Enter valid email id.');
            
            $(document).ready(function($){
                $("#forgot").validate({
                    ignore:[],
                    
                    rules:{
                        email:{
                            required:true,
                            email:true
                        }
                        
                    },
                    
                    messages:{
                        
                        email:{
                            required: "Please enter your email."
                       }
                    }
                    
                    
                });
            });
        </script>
        
        <%@include file="header.jsp"%>
        <br><br><br><br><br><br><br>
        
        <% if(request.getAttribute("status")!=null) {%>
    <center><div class="status"><%=request.getAttribute("status")%></div></center>
        <%}%>
    <br>
        
        <div class="container">
            <form id="forgot" method="POST" action="forgot"> 
                <h1 style="color: red; text-align: center;">Forgot Password?</h1>
                <br>
                
                <h3 style=" color: white; text-align: center; margin-bottom: 20px; line-height: 21px;">Please enter your email-id to recover password.</h3> 
                <center>
                <div>
                    <div>
                        <input id="email" class="form-control" style="width: 70%;" type="text" placeholder="Email-id" name="email" autofocus/>
                    </div>
                </div>
                    
                    <br>    
                <div>
                    <div style="width: 100%">
                        <input type="submit" name="forgotpassword" class="btn btn-primary btn-outline" value="Submit"/> 
                    </div>
                </div>
                </center>
            </form>
        </div>
        
        
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

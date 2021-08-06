<%-- 
    Document   : login
    Created on : 9 Jul, 2021, 4:53:27 PM
    Author     : Aish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | Login</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 

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

        <style>
            td{
                color: white;
                font-family: monospace;
    
            }
            
            td>a{
                color: white;
            }
           
            input{
                width: 350px;
                border-color: white;
                background-color: black;
            }
            
            .error{
                color:red;
            }
            
            #msg
            {
                background-color: black;
                color: red;
                border-color: white;
                width:350px;
                font-weight: bold;
                font-size: 25px;
                padding:5px;
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
        <script>
             // jQuery.validator.addMethod(name, method [, message ] )
            // value -->  "current value of the validated element".
            // element --> "element to be validated"
         
           $.validator.addMethod('checkemail', function(value) {
               return /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/.test(value);
           }, 'Enter the correct email format.');
           
           
            
            $(document).ready(function(){
                 $("#login").validate({
                    wrapper: 'div',
                    errorLabelContainer: "#messageBox",
                    rules:{
                        
                        email:{
                            required: true,
                            checkemail:true
                        },
                        
                        
                        pw:{
                            required:true,
                            minlength:6
                        }
                        
                    },
                    
                    messages:{
                        
                        email:{
                            required: "Please enter your email."
                          
                            
                        },
                        
                       
                        pw:{
                            required:"Please enter your password.",
                            minlength:"Minimum length of password is 6."
                        }
                        
                    }
                });
            });
            
        </script>
        
        <%@include file="header.jsp"%>  
        <br>
        <br><br><br><br><br>
    <center>
        
        <form method="POST" action="register" id="login">
            <br>
            <center><h2 style="color: white; font-family: satisfy,cursive;">LOGIN</h2></center>
            <% if(request.getAttribute("status1")!=null) {%>
                <div id="msg"> <%= request.getAttribute("status1")%></div> 
            <%}%>
            <% if(request.getAttribute("status")!=null) {%>
            <center> <div class="status"><%=request.getAttribute("status")%></div> </center>
            <%}%>
            
            <table>
                
                <tr>
                    <td> EMAIL </td>
                </tr>
                <tr>
                    <td><input type="email" name="email"/></td>
                </tr>
                <tr>
                    <td> PASSWORD </td>
                </tr>
                <tr>
                    <td><input type="password" id="pw" name="pw"/></td>
                </tr>
                <tr>
                    <td><a href="forgotpass.jsp">Forgot Password?</a></td>
                </tr>
                <br>
                <tr>
                
                    <td></br><input type="submit" name="login" value="Sign In" style="background-color: white; color: red;"/></td>
                
                </tr>
                <br><br>
                <tr>
                    <td><a href="createaccount.jsp">Create account</a></td> 
                </tr>
            </table>   
        </form>
        
    </center>
    <br><br><br><br>
    <%@include file="footer.jsp"%>  
           
</body>
</html>

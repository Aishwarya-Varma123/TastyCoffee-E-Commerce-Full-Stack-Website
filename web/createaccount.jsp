<%-- 
    Document   : createaccount
    Created on : 9 Jul, 2021, 6:50:13 PM
    Author     : Aish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | CreateAccount</title>
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
        </style>
    </head>
    <body>
        <script>
            // jQuery.validator.addMethod(name, method [, message ] )
            // value -->  "current value of the validated element".
            // element --> "element to be validated".

            $.validator.addMethod('checkemail', function (value) {
                return /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/.test(value);
            }, 'Please enter the email format as abc@gmail.com.');


            $(document).ready(function () {
                $("#signup").validate({
                    wrapper: 'div',
                    errorLabelContainer: "#messageBox",
                    rules: {
                        name: {
                            required: true
                        },
                        email: {
                            required: true,
                            checkemail: true
                        },
                        phone: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                        cp: {
                            required: true,
                            minlength: 6,
                            equalTo: "#pw"
                        }
                    },
                    messages: {
                        name: {
                            required: "Please enter your name."
                        },
                        email: {
                            required: "Please enter your email."

                        },
                        phone: {
                            required: "Please enter your phone number.",
                            minlength: "Please enter the 10 digit number.",
                            maxlength: "Please enter only 10 digit number."
                        },
                        pw: {
                            required: "Please enter your password.",
                            minlength: "Minimum length of password is 6."
                        },
                        cp: {
                            required: "Please re-enter your password.",
                            minlength: "Minimum length of password is 6.",
                            equalTo: "Mismatch password."
                        }
                    }
                });
            });

        </script>

        <%@include file="header.jsp"%>  
        <br>
        <br><br><br><br><br>
    <center>

        <form method="POST" action="register" id="signup">
            <center><h2 style="color: white; font-family: satisfy,cursive;">CREATE ACCOUNT</h2></center>
                <% if (request.getAttribute("status") != null) {%>   
            <div id="msg"><%= request.getAttribute("status")%></div> 
            <%}%>
            <table>
                <tr>
                    <td> NAME </td>
                </tr>
                <tr>
                    <td><input type="text" id="name" name="name"/></td>
                </tr>
                <tr>
                    <td> PHONE NUMBER </td>
                </tr>
                <tr>
                    <td><input type="number" name="phone"/></td>
                </tr>
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
                    <td> CONFIRM PASSWORD </td>
                </tr>
                <tr>
                    <td><input type="password" name="cp"/></td>
                </tr>
                <br>
                <tr>
                    <td></br><input type="submit" name="register" value="Create" style="background-color: white; color: red;"/></td>
                </tr>

            </table>   
        </form>

    </center>
    <br><br><br><br>
    <%@include file="footer.jsp"%>   
</body>
</html>

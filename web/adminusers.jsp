<%-- 
    Document   : adminusers
    Created on : 24 Jul, 2021, 11:12:32 PM
    Author     : Aish
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.user"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TastyCoffee | AdminManageUsers</title>
        <link rel="icon" href="image/logo.png" type="image/x-icon">
        
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        

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
            th{
                color: white;
                font-size: 20px;
                font-weight: bold;
            }
            
            tr{
                color: black;
                font-size: 19px;
                font-weight: bold;
            }
            
            #search{
                border-color: black;
                color: black;
                
            }
            
            #msg{
                text-align: center;
                background: white;
                padding: 5px;
                width: 30%;
                color: red;
                font-weight: bold;
            }
            
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br><br><br><br><br><br>
        <h1 style="color: whitesmoke; text-align: center; font-family: cursive;"><b>Users List</b></h1>
        
        <br>
        <% if(request.getAttribute("status") != null){%>
    <center><h1 id="msg"> <%= request.getAttribute("status") %></h1></center>
        <%}%>
    
        <div class="container">
            <div class="jumbotron">
                
                <input type="text" class="form-control" id="search" placeholder="Search User.."/>
                
                
                <br><br>
                <table class="table">
                    <thead>
                        <tr style="background-color: black;">
                            <th>User Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Delete</th>
                    
                        </tr>
                    
                    </thead>
                    
                    <tbody id="table">  
                        <% if(session.getAttribute("id") != null && session.getAttribute("id").equals(1)) {
                            //'id' should be equal to 1 i.e., if it is admin then only below data gets displayed.
                            
                            registration reg=new registration(session);
                            ArrayList<user> mydata=reg.getUserDetails();
                            Iterator<user> itr=mydata.iterator();
                            while(itr.hasNext()) 
                            {
                                user s=itr.next();
                        %>
                        <tr>
                            <td><%=s.getId()%></td> 
                            <td><%=s.getName()%></td>
                            <td><%=s.getEmail()%></td>
                            <td><%=s.getPhone()%></td>
                            <td><%=s.getDate()%></td>
                            <td>
                                <form action="delete" method="POST">
                                    <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                    <input type="submit" name="deleteuser" class="btn btn-danger" value="Delete"/>
                                </form>
                            </td>
                        </tr>
                        
                        <%}
                       }%>
                    </tbody>
                </table>    
            </div>
                
        </div>
            
    <script>
        $(document).ready(function(){
            $("#search").on("keyup",function(){
                var value=$(this).val().toLowerCase();
                $("#table tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > 0);
                });
            });
        });
    </script>
        
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

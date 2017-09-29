<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/loginStyle.css">
        <title>WSD - Assignment 1: Login</title>
    </head>
    <body>
        <%
            if (session.getAttribute("student")==null && session.getAttribute("tutor")==null) {
        %>
        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
            <div id="navBar">
                <a href="register.jsp" class="navLink">Register</a>
            </div>
        </div>
        
        <div id="content">
            <h1>UTSTutor - Login</h1>
            <center>
            <form method="POST" action="loginAction.jsp">
                <label>Email Address:</label> <input type="text" name="email" placeholder="e.g. johnsmith@email.com"><br>
                <label>Password:</label> <input type="password" name="password"><br>            
                Don't have an account yet? Click <a href="register.jsp">here</a> to register.<br>
                <input type="Submit" value="Login" class="button">
            </form>  
            </center>
        </div>
        
        <%  
            // ROUTE PROTECTION
            } else {
                response.sendRedirect("main.jsp");
            }
        %>
    </body>
</html>

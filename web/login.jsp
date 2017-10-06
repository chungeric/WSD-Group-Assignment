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
            String emailErrorMsg = (String) session.getAttribute("emailErrorMsg");
            String passwordErrorMsg = (String) session.getAttribute("passwordErrorMsg");
            String existErrorMsg = (String) session.getAttribute("existErrorMsg");

            if (emailErrorMsg == null || passwordErrorMsg == null || existErrorMsg == null) {
                emailErrorMsg = "";
                passwordErrorMsg = "";
                existErrorMsg = "";
            }

            if (session.getAttribute("student") == null && session.getAttribute("tutor") == null) {

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
                <span class="errorText"><%=existErrorMsg%></span><br>
                <form method="POST" action="loginAction.jsp">
                    <input type="hidden" name="formCheck" value="check">
                    <label>Email Address:</label> <input type="text" name="email" placeholder="e.g. johnsmith@email.com"> <span class="errorText"><%=emailErrorMsg%></span><br>
                    <label>Password:</label> <input type="password" name="password"> <span class="errorText"><%=passwordErrorMsg%></span> <br>            
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

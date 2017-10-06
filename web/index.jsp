<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/indexStyle.css">
        <title>WSD - Assignment 1: Index</title>
    </head>
    <body> 
        <%
            if (session.getAttribute("student") == null && session.getAttribute("tutor") == null) {
        %>

        <div id="content">
            <h1>UTSTutor</h1>
            <center>
                <p>
                    UTS internal tutoring system.
                    You need to be registered to use the system.
                </p>
                <p>
                    Web Services Development - Assignment 1:<br>
                    12037661 - Minh Tran<br>
                    11984402 - Eric Chung<br>
                    98104488 - Nicky Punsalan<br>
                </p>

                <a href="login.jsp" class="button">Login</a>
                <a href="register.jsp" class="button">Register</a>
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

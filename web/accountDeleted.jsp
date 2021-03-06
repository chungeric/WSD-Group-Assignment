<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/deletedStyle.css">
        <title>Successfully Deleted!</title>
    </head>
    <body>
        <%
            // ROUTE PROTECTION
            if (session.getAttribute("student") != null || session.getAttribute("tutor") != null) {
        %>

        <div id="content">
            <!--regardless of session, reset beans to null-->
            <% session.setAttribute("student", null);%>  
            <% session.setAttribute("tutor", null);%>
            <h1>Your account has been deleted</h1>
            <center>
                Click <a href="index.jsp">here</a> to return to the index page. 
            </center>
        </div>

        <%
                // ROUTE PROTECTION
            } else {
                // user not logged in
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>

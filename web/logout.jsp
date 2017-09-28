<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSD - Assignment 1: Logout</title>
    </head>
    <body>
        <% 
            // end the current session and go back to the index page.
            session.invalidate(); 
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
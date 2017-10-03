<%-- 
    Document   : accountDeleted
    Created on : 03/10/2017, 2:07:51 PM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successfully Deleted!</title>
    </head>
    <body>
        
        <!--regardless of session, reset beans to null-->
        <% session.setAttribute("student", null);%>  
        <% session.setAttribute("tutor", null);%>
        <h1>Your account has been deleted 
            <a href="login.jsp">return</a>
        </h1>
    </body>
</html>

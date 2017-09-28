<%@ page import="wsdpackage.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/registerStyle.css">
        <title>WSD - Assignment 1: Register for Students</title>
    </head>
    <body>
        
        <%
            // This page is used if the user initially chose "Tutor" as their user type, but then changed it to "Student"
            Student student = (Student) session.getAttribute("student");
        %>
        
        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
        </div>
        <div id="content">
            <h1>Register</h1>
            <form method="POST" action="registerAction.jsp">
                <label>Full Name:</label> <input type="text" name="name" placeholder="e.g. John Smith" value="<%=student.getName()%>"><br>
                <label>Email:</label> <input type="text" name="email" placeholder="e.g. johnsmith@email.com" value="<%=student.getEmail()%>"><br>
                <label>Password:</label> <input type="text" name="password" value="<%=student.getPassword()%>"> <br>
                <label>Date of birth:</label> <input type="text" name="dob" placeholder="e.g. DD/MM/YYYY" value="<%=student.getDob()%>"><br>
                <label>User type:</label>
                    <select id="userType" name="userType">
                        <option value="Student" selected>Student</option>
                        <option value="Tutor">Tutor</option>
                    </select>                    
                <br>
                <input type="Submit" value="Submit" class="button">
            </form>                     

        </div>
    </body>
</html>

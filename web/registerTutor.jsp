<%@ page import="wsdpackage.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/registerStyle.css">
        <title>WSD - Assignment 1: Register for Tutors</title>
    </head>
    <body>
        <%
            // Users who chose "Tutor" as their user type will need to choose their subject of specialty on this page.
            Tutor tutor = (Tutor) session.getAttribute("tutor");
        %>
        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
        </div>
        <div id="content">
            <h1>Register</h1>
            <form method="POST" action="registerTutorAction.jsp">
                <label>Full Name:</label> <input type="text" name="name" placeholder="e.g. John Smith" value="<%=tutor.getName()%>"><br>
                <label>Email:</label> <input type="text" name="email" placeholder="e.g. johnsmith@email.com" value="<%=tutor.getEmail()%>"><br>
                <label>Password:</label> <input type="text" name="password" value="<%=tutor.getPassword()%>"><br>
                <label>Date of birth:</label> <input type="text" name="dob" placeholder="e.g. DD/MM/YYYY" value="<%=tutor.getDob()%>"><br>
                <label>User type:</label>
                    <select id="userType" name="userType">
                        <option value="Student">Student</option>
                        <option value="Tutor" selected>Tutor</option>
                    </select>                    
                <br>
                <label>Subject of Specialty:</label>
                        <select id="subject" name="subject">
                            <option>WSD</option>
                            <option>USP</option>
                            <option>SEP</option>
                            <option>AppProg</option>
                            <option>MobileApp</option>
                        </select>
                <br>
                <input type="Submit" value="Submit" class="button">
            </form>                     
                                               
                        

        </div>
    </body>
</html>

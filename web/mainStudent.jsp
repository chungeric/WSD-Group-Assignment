<%@page import="wsdpackage.Tutor"%>
<%@ page import="wsdpackage.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/mainStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>WSD - Assignment 1: Main Page for Students</title>
    </head>
    <body>
        <%
            Student student = (Student) session.getAttribute("student");
        %>
        
        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
            <div id="navBar">
                <a href="accountStudent.jsp" class="navLink">My Account</a>
                <a href="bookingsStudent.jsp" class="navLink">My Bookings</a>
            </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>
        <div id="content">
            <h1>Welcome <%=student.getName()%>!</h1>
            This is the main page for students.
            <form method="POST" action="welcome.jsp">
                <label>Search: </label> <input type="text" name="search" placeholder="Enter tutor name here...">
                
                <label>Subject: </label>
                    <select name="subject">
                            <option>WSD</option>
                            <option>USP</option>
                            <option>SEP</option>
                            <option>AppProg</option>
                            <option>MobileApp</option>
                    </select>   
                
                <label>Status: </label>
                    <select name="subject">
                            <option>Available</option>
                            <option>Unavailable</option>
                    </select> 
                <input type="Submit" value="Submit" class="button">
                
            </form>
        </div>
            
            
        <div id="tableResults">
            <table>
                
            </table>
            
        </div>
            
            
    </body>
</html>

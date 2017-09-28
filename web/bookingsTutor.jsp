<%@ page import="wsdpackage.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/mainStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>WSD - Assignment 1: Main Page for Tutors</title>
    </head>
    <body>
        <%
            Tutor tutor = (Tutor) session.getAttribute("tutor");
        %>
        <div id="topBar">
            <span>
                <a href="main.jsp" id="logo">UTSTutor</a>
            </span>
                <div id="navBar">
                    <a href="accountTutor.jsp" class="navLink">My Account</a>
                    <a href="#" class="navLink">My Bookings</a>
                </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>
        </body>
</html>

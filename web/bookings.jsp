<%@page import="wsdpackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>WSD - Assignment 1: Bookings Page</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null || session.getAttribute("tutor")!=null) {
        %>
        
        
        <%
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
        %>
        
        <div id="topBar">
            <span>
                <a href="main.jsp" id="logo">UTSTutor</a>
            </span>
            <div id="navBar">
                <a href="account.jsp" class="navLink">My Account</a>
                <a href="bookings.jsp" class="navLink">My Bookings</a>
            </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>
        
        <div id="content">
            <h1>My Bookings</h1>
            <div class="resultContainer">
                <div class="linkContainer">
                <%  if (student != null) {  %>
                
                    <a href="createBooking.jsp" class="button">Create a New Booking</a>
                    
                <%  }   %>
                
                    <button id="allBookingsBtn" class="button filterbtn selected">All</button>
                    <button id="activeBookingsBtn" class="filterbtn button">Active</button>
                    <button id="cancelledBookingsBtn" class="filterbtn button">Cancelled</button>
                    <button id="completedBookingsBtn" class="filterbtn button">Completed</button>
                </div>

                <!-- This page should display all of the user's OWN bookings -->
                <!-- And allow them to toggle between ALL, ACTIVE, CANCELLED and COMPLETED bookings -->

                <%  if (student != null) {  %>

                <c:import url="WEB-INF/bookings.xml" var="inputDoc" />
                <c:import url="WEB-INF/bookings.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                    <x:param name="userType" value="Student" />
                    <x:param name="studentEmail" value="<%=student.getEmail()%>" />
                </x:transform>

                <%  } else {  %>

                <c:import url="WEB-INF/bookings.xml" var="inputDoc" />
                <c:import url="WEB-INF/bookings.xsl" var="stylesheet" />
                <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                    <x:param name="userType" value="Tutor" />
                    <x:param name="tutorEmail" value="<%=tutor.getEmail()%>" />
                </x:transform>

                <%  }  %>
            </div>
        </div>
            
            
        <%  
            // ROUTE PROTECTION
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    <script src="JavaScript/bookings.js"></script>
    </body>
</html>
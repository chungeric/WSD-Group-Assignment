<%@ page import="wsdpackage.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/accountStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <title>WSD - Assignment 1: Account Page for Tutors</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null || session.getAttribute("tutor")!=null) {
                
                // only tutors can access this page
                if (session.getAttribute("tutor")!=null) {
        %>
        
        
        <%
            // Grab the tutor data stored in the java bean
            Tutor tutor = (Tutor) session.getAttribute("tutor");
        %>
        
        <div id="editBkg" onClick="removeEditMode()">
        </div>
        <div id="editContent">
            <div id="exit" onClick="removeEditMode()">x</div>
            <h2>Edit your details:</h2>
                <form method="POST" action="editAccountTutor.jsp">
                    <label>Name:</label> <input type="text" name="name" value="<%=tutor.getName()%>"><br>
                    <label>Password:</label> <input type="password" name="password" value="<%=tutor.getPassword()%>"><br>
                    <label>Date of Birth:</label> <input type="text" name="dob" value="<%=tutor.getDob()%>"><br>
                    <input type="Submit" value="Submit" class="button">
                </form>
        </div>
        <div id="topBar">
            <span>
                <a href="main.jsp" id="logo">UTSTutor</a>
            </span>
                <div id="navBar">
                    <a href="#" class="navLink">My Account</a>
                    <a href="bookings.jsp" class="navLink">My Bookings</a>
                </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>
        <div id="content">
            <h1>Welcome <%=tutor.getName()%>!</h1>
            <h2>Here are your details:</h2>
            <span id="editMode" onClick="editMode()">Edit details <i class="material-icons">mode_edit</i></span><br>
                <b>Name:</b> <%=tutor.getName()%><br>
                <b>Email:</b> <%=tutor.getEmail()%><br>           
                <b>Date of Birth:</b> <%=tutor.getDob()%><br> 
                <b>User Type:</b> <%=tutor.getUserType()%><br>
                <b>Subject of specialty:</b> <%=tutor.getSubject()%><br>
                <b>Status:</b> <%=tutor.getStatus()%><br><br>
                
        </div>
        
                
        <%  
            // ROUTE PROTECTION
            
                } else {
                    // only tutors can access this page
                    response.sendRedirect("main.jsp");
                }

            } else {
                // user not logged in
                response.sendRedirect("index.jsp");
            }
        %>
    <script src="JavaScript/accountStudentJS.js"></script>
    </body>
</html>
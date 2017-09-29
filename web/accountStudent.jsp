<%@ page import="wsdpackage.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/accountStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <title>WSD - Assignment 1: Account Page for Students</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null || session.getAttribute("tutor")!=null) {
                
                // only students can access this page
                if (session.getAttribute("student")!=null) {
        %>
        
        
        <%
            
            // Grab the student data stored in the java bean
            Student student = (Student) session.getAttribute("student");
        %>
        
        <div id="editBkg" onClick="removeEditMode()">
        </div>
        <div id="editContent">
            <div id="exit" onClick="removeEditMode()">x</div>
            <h2>Edit your details:</h2>
                <form method="POST" action="editAccountStudent.jsp">
                    <label>Name:</label> <input type="text" name="name" value="<%=student.getName()%>"><br>
                    <label>Password:</label> <input type="password" name="password" value="<%=student.getPassword()%>"><br>
                    <label>Date of Birth:</label> <input type="text" name="dob" value="<%=student.getDob()%>"><br>
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
            <h1>Welcome <%=student.getName()%>!</h1>
            <h2>Here are your details:</h2>
            <span id="editMode" onClick="editMode()">Edit details <i class="material-icons">mode_edit</i></span><br>
                <b>Name:</b> <%=student.getName()%><br>
                <b>Email:</b> <%=student.getEmail()%><br>
                <b>Date of Birth:</b> <%=student.getDob()%><br> 
                <b>User Type:</b> <%=student.getUserType()%><br><br>
                
                


        </div>
                
        <%  
            // ROUTE PROTECTION
            
                } else {
                    // only students can access this page
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
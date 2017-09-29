<%@page import="wsdpackage.Students"%>
<%@ page import="wsdpackage.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/accountStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <title>WSD - Assignment 1: Main Page for Tutors</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null) {
                
                if (request.getParameter("name")!=null && request.getParameter("password")!=null
                        && request.getParameter("dob")!=null) {
        %>
        
        
        <% String studentFilePath = application.getRealPath("WEB-INF/students.xml"); %>  
        <jsp:useBean id="studentCache" class="wsdpackage.StudentCache" scope="application">
        <jsp:setProperty name="studentCache" property="filePath" value="<%=studentFilePath%>"/>
        </jsp:useBean>
        <%
            // Grab the list of students from the Students XML
            Students students = studentCache.getStudents();
            
            // Get the student's data from the current bean
            Student student = (Student) session.getAttribute("student");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            
            // After grabbing the edited details, let's set them.
            student.setName(name);
            student.setPassword(password);
            student.setDob(dob);
            
            // Update the details of the student in the Student XML file
            studentCache.updateXML(students, studentFilePath);
            
            //Update and go back to the student's account page
            response.sendRedirect("accountStudent.jsp");
        %>
        
        
        <%  
            // ROUTE PROTECTION
            
                } else {
                    response.sendRedirect("main.jsp");
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
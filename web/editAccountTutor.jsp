<%@page import="wsdpackage.Tutors"%>
<%@ page import="wsdpackage.Tutor"%>
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
            if (session.getAttribute("tutor")!=null) {
                
                if (request.getParameter("name")!=null && request.getParameter("password")!=null
                        && request.getParameter("dob")!=null) {
        %>
        
        
           <% String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml"); %>  
           
            <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
            <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
            </jsp:useBean>
        <%
            // Grab the list of tutors from the tutor XML
            Tutors tutors = tutorCache.getTutors();
            
            // Get the tutors's data from the current bean
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            
            // After grabbing the edited details, let's set them.
            tutor.setName(name);
            tutor.setPassword(password);
            tutor.setDob(dob);
            
            // Update the details of the student in the Student XML file
            tutorCache.updateXML(tutors, tutorFilePath);
                
            //Update and go back to the tutor's account page
            response.sendRedirect("account.jsp");
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
<%@page import="wsdpackage.DataValidator"%>
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
            
            session.setAttribute("nameErrorMsg", "");
            session.setAttribute("passwordErrorMsg", "");
            session.setAttribute("dobErrorMsg", "");
            session.setAttribute("detailsErrorMsg", "");
            
            // Get the tutors's data from the current bean
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            DataValidator validator = new DataValidator();
            
            if (!validator.validateName(name)  || !validator.validatePassword(password) || !validator.validateDob(dob)) {
                    if (!validator.validateName(name)) {
                        session.setAttribute("detailsErrorMsg", "Your details could not be updated. Errors with input."); 
                        session.setAttribute("nameErrorMsg", "Please begin each name with a capital letter and only use letters");
                    }  
                    if (!validator.validatePassword(password)) {
                        session.setAttribute("detailsErrorMsg", "Your details could not be updated. Errors with input."); 
                        session.setAttribute("passwordErrorMsg", "Invalid password format");         
                    }  
                    if (!validator.validateDob(dob)) {
                        session.setAttribute("detailsErrorMsg", "Your details could not be updated. Errors with input."); 
                        session.setAttribute("dobErrorMsg", "Invalid date of birth format");         
                    }  
 
                response.sendRedirect("account.jsp");  
            }
            else {            
            
            // After grabbing the edited details, let's set them.
            tutor.setName(name);
            tutor.setPassword(password);
            tutor.setDob(dob);
            
            // Update the details of the student in the Student XML file
            tutorCache.updateXML(tutors, tutorFilePath);
                
            //Update and go back to the tutor's account page
            response.sendRedirect("account.jsp");
            }
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
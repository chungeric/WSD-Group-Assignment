<%@page import="wsdpackage.Student"%>
<%@page import="wsdpackage.Students"%>
<%@page import="wsdpackage.Tutors"%>
<%@page import="wsdpackage.Tutor"%>
<%@page import="wsdpackage.DataValidator"%>

<%@ page import = "java.io.*,java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSD - Assignment 1: Login Status</title>
    </head>
    <body>
        
        
        
        <%
            // ---- Get the xml files containing the students and the tutors ---- /
            String studentFilePath = application.getRealPath("WEB-INF/students.xml");
            String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml");
        %>

        <jsp:useBean id="studentCache" class="wsdpackage.StudentCache" scope="application">
        <jsp:setProperty name="studentCache" property="filePath" value="<%=studentFilePath%>"/>
        </jsp:useBean>

        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
        <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
        </jsp:useBean>

        <%
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            // ----- Get list of students and use the inputted email and password from the user to login ----- //
            Students students = studentCache.getStudents();
            Student student = students.login(email, password);
            
             // ----- Get list of tutors and use the inputted email and password from the user to login ----- //
            Tutors tutors = tutorCache.getTutors();
            Tutor tutor = tutors.login(email, password);  
            
            
            // ADD VALIDATION HERE USING VALIDATOR CLASS
            DataValidator validator = new DataValidator();
            session.setAttribute("emailErrorMsg", "");
            session.setAttribute("passwordErrorMsg", "");
            session.setAttribute("existErrorMsg", "");
            
            if (!validator.validateEmail(email)) {
                session.setAttribute("emailErrorMsg", "Incorrect email");
                    if (!validator.validatePassword(password)) {
                    session.setAttribute("passwordErrorMsg", "Incorrect password");         
                    }
                response.sendRedirect("login.jsp");  
            }
            
            else if (!validator.validateEmail(email)) {
                session.setAttribute("emailErrorMsg", "Incorrect email");         
                response.sendRedirect("login.jsp");  
            }
            
            else if (!validator.validatePassword(password)) {
                session.setAttribute("passwordErrorMsg", "Incorrect password");         
                response.sendRedirect("login.jsp");  
            }
            
            // check if login with email and password was successful
            // if it's not successful, go back to the login page
            else if (validator.validateEmail(email) && validator.validatePassword(password) && student == null && tutor == null) {
                session.setAttribute("existErrorMsg", "Your email or password is incorrect");
                response.sendRedirect("login.jsp");
            }
            
            // if it is successful, and email and password match with a student's credentials..
            // ... redirect to student main page if the login with student credentials was successful
            else if (student != null) {
                session.setAttribute("student", student); 
                response.sendRedirect("main.jsp");
            }

            // if it is successful, and email and password match with a tutor's credentials..
            // redirect to tutor main page if the login with tutor credentials was successful
            else {
                session.setAttribute("tutor", tutor); 
                response.sendRedirect("main.jsp");
            }
        %>        
        
        
    </body>
</html>

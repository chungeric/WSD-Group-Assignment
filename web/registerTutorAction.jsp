<%@page import="wsdpackage.Students"%>
<%@ page import="wsdpackage.Student"%>
<%@page import="wsdpackage.Tutors"%>
<%@ page import="wsdpackage.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSD - Assignment 1: Register Action</title>
    </head>
    <body>
   <% String studentFilePath = application.getRealPath("WEB-INF/students.xml"); %>  
   <% String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml"); %> 
   
    <jsp:useBean id="studentCache" class="wsdpackage.StudentCache" scope="application">
    <jsp:setProperty name="studentCache" property="filePath" value="<%=studentFilePath%>"/>
    </jsp:useBean>
   
    <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
    <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
    </jsp:useBean>
   
    <%      Students students = studentCache.getStudents();
            Tutors tutors = tutorCache.getTutors();
            
            String name = request.getParameter("name");
            String email = request.getParameter("email"); 
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String userType = request.getParameter("userType");
            String subject = request.getParameter("subject");
            String status = "Available";
            
            // If the user changes their mind, and changes their user type from Tutor to Student, we need to update the register page.
            if (userType.equals("Student")) {
                userType = "Student";
                Student student = new Student(name, email, password, dob, userType);
                session.setAttribute("student", student);
                
                response.sendRedirect("registerStudent.jsp");
            }
            
            
            // If the user is a Tutor and has picked their subject of speciality, let's register them.
            else {
                Tutor tutor = new Tutor(name, email, password, dob, userType, subject, status);
                session.setAttribute("tutor", tutor); 
                tutors.addTutor(tutor);
                tutorCache.updateXML(tutors, tutorFilePath);
                response.sendRedirect("mainTutor.jsp"); // Since they are a tutor, let's go to the main page for tutors.
            }


        %>
        <p>Welcome <%=name%></p>
        <p>Your Email is <%=email%></p>
        <p>Your password is <%=password%></p>
        <p>Your dob is <%=dob%></p>
        <p>Your userType is <%=userType%></p>
        <p>Click <a href="mainStudent.jsp">here</a> to proceed to the main page.</p>
    </body>
</html>

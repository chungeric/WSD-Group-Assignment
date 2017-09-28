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
   
    <%     
            // Grab list of students from the Students XML file
            Students students = studentCache.getStudents();
            // Grab list of tutors from the Tutors XML file
            Tutors tutors = tutorCache.getTutors();

            String name = request.getParameter("name");
            String email = request.getParameter("email"); 
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String userType = request.getParameter("userType");
            String subject = request.getParameter("subject");
            String status = "Available";
                        
            // First, we need to check if a student or tutor already has the same email which was inputted by the user
            Student potentialStudent = students.checkForDuplicate(email);
            Tutor potentialTutor = tutors.checkForDuplicate(email);
            
            
            // If there is student or tutor with the same email stored in the XML file, then we'll go back to the register page
            if ((potentialStudent != null) || (potentialTutor != null)) {
                response.sendRedirect("register.jsp");            
            }
            
            // If the user's email doesn't match anyone in the XML files, and if they selected "Student" as their user type, let's register them.
            else if (userType.equals("Student")) {
                Student student = new Student(name, email, password, dob, userType);
                session.setAttribute("student", student);
                students.addStudent(student);
                studentCache.updateXML(students, studentFilePath);
                
                response.sendRedirect("main.jsp"); // Since they are a student, let's go to the main page for students.
            }
            
            
            // If the user's email doesn't match anyone in the XML files, and if they selected "Tutor" as their user type, let's register them.
            else {
                if (subject.equals("")) {
                    session.setAttribute("specialtyErr", "Select your subject of specialty");
                    response.sendRedirect("register.jsp");  
                } else {
                    Tutor tutor = new Tutor(name, email, password, dob, userType, subject, status);
                    session.setAttribute("tutor", tutor);
                    tutors.addTutor(tutor);
                    tutorCache.updateXML(tutors, tutorFilePath);
                    response.sendRedirect("main.jsp");
                }
            }

        %>
        
    </body>
</html>

<%@page import="wsdpackage.Students"%>
<%@ page import="wsdpackage.Student"%>
<%@page import="wsdpackage.Tutors"%>
<%@ page import="wsdpackage.Tutor"%>
<%@ page import="wsdpackage.DataValidator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSD - Assignment 1: Register Action</title>
    </head>
    <body>
        <%
            // ROUTE PROTECTION
            if (session.getAttribute("student") == null && session.getAttribute("tutor") == null) {

                if (request.getParameter("formCheck") != null) {
        %>

        <% String studentFilePath = application.getRealPath("WEB-INF/students.xml"); %>  
        <% String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml");%> 

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

            session.setAttribute("nameErrorMsg", "");
            session.setAttribute("emailErrorMsg", "");
            session.setAttribute("passwordErrorMsg", "");
            session.setAttribute("dobErrorMsg", "");
            session.setAttribute("subjectErrorMsg", "");
            session.setAttribute("existRegisterErrorMsg", "");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String userType = request.getParameter("userType");
            String subject = request.getParameter("subject");
            String status = "Available";
            DataValidator validator = new DataValidator();

            // First, we need to check if a student or tutor already has the same email which was inputted by the user
            Student potentialStudent = students.checkForDuplicate(email);
            Tutor potentialTutor = tutors.checkForDuplicate(email);

            // If there is student or tutor with the same email stored in the XML file, then we'll go back to the register page
            if ((potentialStudent != null) || (potentialTutor != null)) {
                session.setAttribute("existRegisterErrorMsg", "User already exists");
                response.sendRedirect("register.jsp");
            } else if (!validator.validateName(name) || !validator.validateEmail(email) || !validator.validatePassword(password) || !validator.validateDob(dob)) {
                if (!validator.validateName(name)) {
                    session.setAttribute("nameErrorMsg", "Please begin each name with a capital letter and only use letters");
                }
                if (!validator.validateEmail(email)) {
                    session.setAttribute("emailErrorMsg", "Invalid email address");
                }
                if (!validator.validatePassword(password)) {
                    session.setAttribute("passwordErrorMsg", "Password must be 6 or more characters");
                }
                if (!validator.validateDob(dob)) {
                    session.setAttribute("dobErrorMsg", "Invalid date of birth");
                }

                response.sendRedirect("register.jsp");
            } // If the user's email doesn't match anyone in the XML files, and if they selected "Student" as their user type, let's register them.
            else if (userType.equals("Student")) {
                Student student = new Student(name, email, password, dob, userType);
                session.setAttribute("student", student);
                students.addStudent(student);
                studentCache.updateXML(students, studentFilePath);

                response.sendRedirect("main.jsp"); // Since they are a student, let's go to the main page for students.
            } // If the user's email doesn't match anyone in the XML files, and if they selected "Tutor" as their user type, let's register them.
            else {
                if (!validator.validateSubject(subject)) {
                    session.setAttribute("subjectErrorMsg", "Must select a subject of specialty as a tutor");
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


        <%                    // ROUTE PROTECTION
                } else {
                    response.sendRedirect("index.jsp");
                }

            } else {
                response.sendRedirect("main.jsp");
            }
        %>
    </body>
</html>

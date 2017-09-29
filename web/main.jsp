<%@page import="java.util.*"%>
<%@page import="wsdpackage.Tutor"%>
<%@page import="wsdpackage.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/mainStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>WSD - Assignment 1: Main Page for Students</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null || session.getAttribute("tutor")!=null) {
        %>
        
        
        <%   String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml"); %>
        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
        <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
        </jsp:useBean>
        
        <%
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            
            String filter = request.getParameter("filter");
            String search = request.getParameter("search");
            
            ArrayList<Tutor> tutorList = null;
            if (filter != null) {
                if (filter.equals("subject")) {
                    tutorList = tutorCache.getTutors().getTutorsBySubject(search);
                } else if (filter.equals("name")) {
                    tutorList = tutorCache.getTutors().getTutorsByName(search);
                } else if (filter.equals("status")) {
                    tutorList = tutorCache.getTutors().getTutorsByStatus(search);
                }
            }
        %>
        
        <div id="topBar">
            <span>
                <a href="main.jsp" id="logo">UTSTutor</a>
            </span>
            <div id="navBar">
                <% if(student != null) { %>
                <a href="accountStudent.jsp" class="navLink">My Account</a>
                <% } else { %>
                <a href="accountTutor.jsp" class="navLink">My Account</a>
                <% } %>
                <a href="bookings.jsp" class="navLink">My Bookings</a>
            </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>
            
            
        <div id="content">
            <%
                // user is a student, display this
                if(student != null) {
            %>
            <h1>Welcome <%=student.getName()%>!</h1>
            This is the main page for students.
            <div id="searchContainer">
                <form method="POST" action="main.jsp" class="searchForm">
                    <table>
                        <tr>
                            <td>
                                <!--  Might need a better way to structure this  -->
                                Find tutor by: 
                                <select id="filter" name="filter">
                                    <option value="">Select a filter</option>
                                    <option value="subject">Subject</option>
                                    <option value="name">Name</option>
                                    <option value="status">Status</option>
                                </select>
                                <input type="text" name="search">
                                <input type="Submit" value="Submit" class="button">
                            </td>
                        </tr>
                    </table>
                </form>

                <%  if (tutorList != null) {  %>
                    <c:import url="WEB-INF/tutors.xml" var="inputDoc" />
                    <c:import url="WEB-INF/tutors.xsl" var="stylesheet" />
                    <x:transform xml = "${inputDoc}" xslt = "${stylesheet}">
                        <x:param name="<%=filter%>" value="<%=search%>" />
                    </x:transform>
                <%  }  %>
            </div>
            <%
                // user is a tutor, display this instead
                } else {
            %>
            <h1>Welcome <%=tutor.getName()%>!</h1>
            <h2>Your subject of specialty is <%=tutor.getSubject()%></h2>
                This is the main page for tutors.
            <%
                }
            %>
        </div>
    
        
        
        <%  
            // ROUTE PROTECTION
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>

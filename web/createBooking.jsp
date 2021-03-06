<%@page import="wsdpackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/main.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>WSD - Assignment 1: Create Booking Page</title>
    </head>
    <body>
        <%
            // ROUTE PROTECTION
            if (session.getAttribute("student") != null || session.getAttribute("tutor") != null) {

                if (session.getAttribute("student") != null) {
        %>


        <%
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String subject = request.getParameter("subject");
            String status = request.getParameter("status");

            String existTutorErrorMsg = (String) session.getAttribute("existTutorErrorMsg");
            String unavailableTutorErrorMsg = (String) session.getAttribute("unavailableTutorErrorMsg");

            if (existTutorErrorMsg == null) {
                existTutorErrorMsg = "";
            }
            if (unavailableTutorErrorMsg == null) {
                unavailableTutorErrorMsg = "";
            }

        %>

        <div id="topBar">
            <span>
                <a href="main.jsp" id="logo">UTSTutor</a>
            </span>
            <div id="navBar">
                <a href="account.jsp" class="navLink">My Account</a>
                <a href="bookings.jsp" class="navLink">My Bookings</a>
            </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
        </div>

        <div id="content">
            <h1>Create a Booking</h1>
            <form method="POST" action="createBookingAction.jsp">
                <table>
                    <tr>
                        <td>Tutor Email: </td>
                        <%  if (email != null) {%>
                        <td><input type="text" value="<%=email%>" name="email"></td>
                            <%  } else {  %>
                        <td><input type="text" name="email"></td>
                            <%  }%>
                        <td>
                            <span class="errorText"><%=existTutorErrorMsg%></span>
                            <span class="errorText"><%=unavailableTutorErrorMsg%></span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create booking" class="button"></td>
                    </tr>
                </table>
            </form>
        </div>


        <%
                    // ROUTE PROTECTION

                } else {
                    // even if logged in, users should not be able to access this page
                    response.sendRedirect("main.jsp");
                }

            } else {
                // user not logged in
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>

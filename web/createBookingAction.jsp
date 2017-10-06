<%-- 
    Document   : createBookingAction
    Created on : 27/09/2017, 4:07:53 PM
    Author     : ericchung
--%>

<%@page import="wsdpackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>createBookingAction</title>
    </head>
    <body>
        <%
            // ROUTE PROTECTION
            // checks that a student / tutor is logged on
            if (session.getAttribute("student") != null || session.getAttribute("tutor") != null) {

                // if TUTOR is logged in, but tried to access this url
                // without clicking a book tutor button, they should be sent away (to main.jsp)
                if (session.getAttribute("student") != null && request.getParameter("email") != null) {

        %>


        <%            String tutorEmail = request.getParameter("email");

            Student student = (Student) session.getAttribute("student");

        %>

        <%            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
            String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
        %>

        <jsp:useBean id="bookingCache" class="wsdpackage.BookingCache" scope="application">
            <jsp:setProperty name="bookingCache" property="filePath" value="<%=bookingsFilePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
            <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>

        <%
            Bookings bookings = bookingCache.getBookings();
            Tutors tutors = tutorCache.getTutors();
            Tutor tutor = tutors.getTutorByEmail(tutorEmail);

            session.setAttribute("existTutorErrorMsg", "");

            // The tutor exists and is available, we can create a booking with them
            if (tutor != null && tutor.getStatus().equals("Available")) {
                String tutorName = tutor.getName();
                String tutorSubject = tutor.getSubject();
                String studentName = student.getName();
                String studentEmail = student.getEmail();

                // gets the amount of bookings already in bookingsCache and adds 1
                // i.e. if 1 there is booking already, new booking ID will be 2
                int bookingID = bookingCache.getBookings().getList().size() + 1;

                // need to update tutor's status to Unavailable
                tutor.setStatus("Unavailable");
                tutorCache.updateXML(tutors, tutorsFilePath);

                // add booking to bookings.xml
                Booking booking = new Booking(bookingID, tutorName, tutorEmail, tutorSubject, studentName, studentEmail, "active");
                bookings.addBooking(booking);
                bookingCache.updateXML(bookings, bookingsFilePath);

                session.setAttribute("existTutorErrorMsg", "");
                session.setAttribute("unavailableTutorErrorMsg", "");

                response.sendRedirect("bookings.jsp");

            } else {
                if (tutor == null) {
                    session.setAttribute("existTutorErrorMsg", "Tutor does not exist");
                    session.setAttribute("unavailableTutorErrorMsg", "");
                } else {
                    session.setAttribute("unavailableTutorErrorMsg", "Tutor is not available");
                    session.setAttribute("existTutorErrorMsg", "");
                }

                response.sendRedirect("createBooking.jsp");
            }
        %>


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

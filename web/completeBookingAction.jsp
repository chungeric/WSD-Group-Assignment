
<%@page import="wsdpackage.Tutor"%>
<%@page import="wsdpackage.Tutors"%>
<%@page import="wsdpackage.Booking"%>
<%@page import="wsdpackage.Bookings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>completeBooking action page</title>
    </head>
    <body>
        <%
            // ROUTE PROTECTION
            // checks that a student / tutor is logged on
            if (session.getAttribute("student") != null || session.getAttribute("tutor") != null) {

                // if user is logged in, but tried to access this url
                // without clicking a cancel button, they should be sent away (to main.jsp)
                if (request.getParameter("bookingID") != null) {

        %>


        <%            int bookingID = Integer.parseInt(request.getParameter("bookingID"));

            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
            String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml");
        %>

        <jsp:useBean id="bookingCache" class="wsdpackage.BookingCache" scope="application">
            <jsp:setProperty name="bookingCache" property="filePath" value="<%=bookingsFilePath%>"/>
        </jsp:useBean>

        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
            <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
        </jsp:useBean>

        <%
            Bookings bookings = bookingCache.getBookings();
            Tutors tutors = tutorCache.getTutors();

            // gets booking to complete using bookingID
            Booking booking = bookings.getBookingID(bookingID);

            // gets the tutor associated with this booking we are trying to complete
            Tutor tutor = tutors.getTutorByEmail(booking.getTutorEmail());

            // Change bookingStatus from active to completed and update bookings.xml
            booking.setBookingStatus("completed");

            // Change tutorStatus from Unavailable to Available and update tutors.xml
            tutor.setStatus("Available");
            tutorCache.updateXML(tutors, tutorFilePath);
            bookingCache.updateXML(bookings, bookingsFilePath);

            response.sendRedirect("bookings.jsp");

        %>


        <%                    // ROUTE PROTECTION
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

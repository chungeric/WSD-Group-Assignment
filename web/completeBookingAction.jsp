
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
            int bookingID = Integer.parseInt(request.getParameter("bookingID"));
            
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
            
            Tutor tutor = tutors.getTutorEmail(booking.getTutorEmail());
            
            // Change bookingStatus from active to completed and update bookings.xml
            
            booking.setBookingStatus("completed");
            bookingCache.updateXML(bookings, bookingsFilePath);
            
            // Change tutorStatus from Unavailable to Available and update tutors.xml
            
            tutor.setStatus("Available");
            tutorCache.updateXML(tutors, tutorFilePath);
            
            response.sendRedirect("bookings.jsp");

        %>
        
    </body>
</html>

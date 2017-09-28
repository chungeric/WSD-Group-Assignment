
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
            
            Booking booking = bookings.getBookingID(bookingID);
            
            // Change bookingStatus from active to completed and update XML
            // Set tutorStatus from Unavailable to Available and update XML

            



        %>
        
    </body>
</html>

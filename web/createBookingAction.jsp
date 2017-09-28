<%-- 
    Document   : createBookingAction
    Created on : 27/09/2017, 4:07:53 PM
    Author     : ericchung
--%>

<%@page import="wsdpackage.Bookings"%>
<%@page import="wsdpackage.Student"%>
<%@page import="java.util.Random"%>
<%@page import="wsdpackage.Tutor"%>
<%@page import="wsdpackage.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>createBookingAction</title>
    </head>
    <body>
        
        <%  
            
            String tutorEmail = request.getParameter("email");
            
            
            Student student = (Student) session.getAttribute("student");

        %>
        
        <%    
            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");  
            String tutorsFilePath = application.getRealPath("WEB-INF/bookings.xml");
        %>
        <jsp:useBean id="bookingCache" class="wsdpackage.BookingCache" scope="application">
        <jsp:setProperty name="bookingCache" property="filePath" value="<%=bookingsFilePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
        <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
        
        <!-- Validate Booking Details in Validator Java Bean here using regular expression checks in the Javabean -->
        
        
        
        
        <%
            Bookings bookings = bookingCache.getBookings();
            
            Tutor tutor = tutorCache.getTutors().getTutorEmail(tutorEmail);
            
            // The tutor exists and is available, we can create a booking with them
            if (tutor != null && tutor.getStatus().equals("Available")) {
                String tutorName = tutor.getName();
                String tutorSubject = tutor.getSubject();
                String studentName = student.getName();
                String studentEmail = student.getEmail();
                int bookingID = bookingCache.getBookings().getList().size() + 1;
                
                // need to update tutor's status to Unavailable
                // maybe marshalling and unmarshalling?
                
                
                
                Booking booking = new Booking(bookingID, tutorName, tutorEmail, tutorSubject, studentName, studentEmail, "active");
                bookings.addBooking(booking);
                bookingCache.updateXML(bookings, bookingsFilePath);
                response.sendRedirect("bookings.jsp");
                
            } else {
                response.sendRedirect("createBooking.jsp");
            }
        %>
        
        
    </body>
</html>
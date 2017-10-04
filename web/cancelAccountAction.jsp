
<%@page import="java.util.ArrayList"%>
<%@page import="wsdpackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--import uts.wsd.*;
import wsdpackage;
import java.util.*;-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cancelAccount action page</title>
    </head>
    <body>
        
        
        <%
            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
            String studentFilePath = application.getRealPath("WEB-INF/students.xml");
            String tutorFilePath = application.getRealPath("WEB-INF/tutors.xml");
            
            Student student = (Student)session.getAttribute("student");
            Tutor tutor = (Tutor)session.getAttribute("tutor");

            
        %>
        
        <jsp:useBean id="bookingCache" class="wsdpackage.BookingCache" scope="application">
        <jsp:setProperty name="bookingCache" property="filePath" value="<%=bookingsFilePath%>"/>
        </jsp:useBean>
        
        <jsp:useBean id="studentCache" class="wsdpackage.StudentCache" scope="application">
        <jsp:setProperty name="studentCache" property="filePath" value="<%=studentFilePath%>"/>
        </jsp:useBean>
        
        <jsp:useBean id="tutorCache" class="wsdpackage.TutorCache" scope="application">
        <jsp:setProperty name="tutorCache" property="filePath" value="<%=tutorFilePath%>"/>
        </jsp:useBean>
        
        <%
            Bookings bookings = bookingCache.getBookings();
            Students students = studentCache.getStudents();
            Tutors tutors = tutorCache.getTutors();

            
            if (student != null) {
                // gets student unique email so that we can also modify in bookings.xml and tutors.xml
                // to see if student matches any bookings and tutors, than update statuses
                String email = student.getEmail();
                ArrayList<Booking> cancelled = bookings.getStudentWithEmail(email);
                if (cancelled != null) {
                    for (Booking booking : cancelled){
                        booking.setBookingStatus("cancelled");
                        bookingCache.updateXML(bookings, bookingsFilePath);
                        Tutor tutorUpdate = tutors.getTutorByEmail(booking.getTutorEmail());  
                        tutorUpdate.setStatus("Available");
                        tutorCache.updateXML(tutors, tutorFilePath); 
                    }
                }
                students.removeUser(student);
                studentCache.updateXML(students, studentFilePath);
                response.sendRedirect("accountDeleted.jsp");
                
            } else {

                // gets tutor from the bean and their unique email for modification in bookings.xml and tutors.xml
                String email = tutor.getEmail();
                ArrayList<Booking> cancelling = bookings.getTutorWithEmail(email);
                if (cancelling != null) {
                    for (Booking booking : cancelling){
                        booking.setBookingStatus("cancelled");
                        bookingCache.updateXML(bookings, bookingsFilePath);
                    }
                }
                tutors.removeUser(tutor);
                tutorCache.updateXML(tutors, tutorFilePath);
                response.sendRedirect("accountDeleted.jsp");  
            }
        %>    
    </body>
</html>
package uts.wsd.rest;
 
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import uts.wsd.*;
import wsdpackage.*;
import java.util.*;


/**
 *      http://localhost:8080/WSD-Group-Assignment/rest/bookings/status/Available example search.
 */

@Path("/bookings")
public class BookingsService {
    
 @Context
 private ServletContext application;
 
 private BookingCache getAllBookings() throws JAXBException, IOException, Exception {
    synchronized (application) {
    BookingCache bookings = (BookingCache)application.getAttribute("bookings");
    if (bookings == null) {
        bookings = new BookingCache();
        bookings.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
        application.setAttribute("bookings", bookings);
    }
    return bookings;
    }
 }
 
    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }
    
    @Path("allbookings")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Bookings getUsers() throws IOException, Exception {
       return getAllBookings().getBookings();
    }
    
       
    @Path("id/{bookingID}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Booking getBookingID(@PathParam("bookingID") int bookingID) throws Exception{
        return getAllBookings().getBookings().getBookingID(bookingID);
    }
    
    @Path("email/{studentEmail}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getUser(@PathParam("studentEmail") String studentEmail) throws Exception{
        return getAllBookings().getBookings().getStudentWithEmail(studentEmail);
    }
      
    @Path("subject/{subject}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getSubject(@PathParam("subject") String subject) throws Exception{
        return getAllBookings().getBookings().getSubject(subject);
    }
    
    @Path("status/{bookingStatus}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getBookingStatus(@PathParam("bookingStatus") String bookingStatus) throws Exception{
        return getAllBookings().getBookings().getBookingStatus(bookingStatus);
    }
    
    
    
}

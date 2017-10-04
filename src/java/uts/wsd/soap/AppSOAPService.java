/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import wsdpackage.Booking;
import wsdpackage.BookingCache;
import wsdpackage.Bookings;
import wsdpackage.Student;
import wsdpackage.StudentCache;
import wsdpackage.Tutor;
import wsdpackage.TutorCache;
import wsdpackage.Tutors;

/**
 *
 * @author ericchung
 */
@WebService(serviceName = "AppSOAPService")
public class AppSOAPService {
    
    @Resource
    private WebServiceContext context;
   
    private StudentCache getStudentCache() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            StudentCache studentCache = (StudentCache) application.getAttribute("studentCache");
            if (studentCache == null) {
                studentCache = new StudentCache();
                studentCache.setFilePath(application.getRealPath("WEB-INF/students.xml"));
                application.setAttribute("studentCache", studentCache);
            }
            return studentCache;
        }
    }
    
    private TutorCache getTutorCache() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            TutorCache tutorCache = (TutorCache) application.getAttribute("tutorCache");
            if (tutorCache == null) {
                tutorCache = new TutorCache();
                tutorCache.setFilePath(application.getRealPath("WEB-INF/tutors.xml"));
                application.setAttribute("tutorCache", tutorCache);
            }
            return tutorCache;
        }
    }
    
    private BookingCache getBookingCache() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            BookingCache bookingCache = (BookingCache) application.getAttribute("bookingCache");
            if (bookingCache == null) {
                bookingCache = new BookingCache();
                bookingCache.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingCache", bookingCache);
            }
            return bookingCache;
        }
    }
    
//    /**
//     * This is a sample web service operation
//     */
//    @WebMethod(operationName = "hello")
//    public String hello(@WebParam(name = "name") String txt) {
//        return "Hello " + txt + " !";
//    }
    
    @WebMethod()
    public Student studentLogin(String email, String password) throws IOException, Exception {
        ArrayList<Student> studentList = getStudentCache().getStudents().getList();

        for (Student student : studentList) {
            if (student.getEmail().equals(email) && student.getPassword().equals(password)) {
                return student; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }
    
    @WebMethod()
    public Tutor tutorLogin(String email, String password) throws IOException, Exception {
        ArrayList<Tutor> tutorList = getTutorCache().getTutors().getList();
        for (Tutor tutor : tutorList) {
            if (tutor.getEmail().equals(email) && tutor.getPassword().equals(password))
                return tutor; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    @WebMethod()
    public Booking filterBookingsById(int id) throws IOException, Exception {
        Booking booking = getBookingCache().getBookings().getBookingID(id);
        return booking;
    }
    
    @WebMethod()
    public ArrayList<Booking> filterBookingsByStudentEmail(String email) throws IOException, Exception {
        ArrayList<Booking> bookingsList = getBookingCache().getBookings().getStudentWithEmail(email);
        return bookingsList;
    }
    
    @WebMethod()
    public ArrayList<Booking> filterBookingsBySubject(String subject) throws IOException, Exception {
        ArrayList<Booking> bookingsList = getBookingCache().getBookings().getSubject(subject);
        return bookingsList;
    }
    
    @WebMethod()
    public ArrayList<Booking> filterBookingsByStatus(String status) throws IOException, Exception {
        ArrayList<Booking> bookingsList = getBookingCache().getBookings().getBookingStatus(status);
        return bookingsList;
    }
    
    @WebMethod()
    public void createBooking(int bookingID, String tutorName, String tutorEmail, String subject, String studentName, String studentEmail, String bookingStatus) throws IOException, Exception {
        Booking booking = new Booking(bookingID, tutorName, tutorEmail, subject, studentName, studentEmail, bookingStatus);
        Bookings bookings = getBookingCache().getBookings();
        bookings.addBooking(booking);
        getBookingCache().updateXML(bookings, "WEB-INF/bookings.xml");
    }
    
    @WebMethod()
    public ArrayList<Booking> viewBookings(String email) throws IOException, Exception {
        
        if (getBookingCache().getBookings().getStudentWithEmail(email) != null) {
            ArrayList<Booking> allBookings = getBookingCache().getBookings().getStudentWithEmail(email);
            return allBookings;
        } else if (getBookingCache().getBookings().getTutorWithEmail(email) != null) {
            ArrayList<Booking> allBookings = getBookingCache().getBookings().getTutorWithEmail(email);
            return allBookings;
        }
        return null;
    }
    
    @WebMethod()
    public void cancelBooking(int id) throws IOException, Exception {
        Bookings bookings = getBookingCache().getBookings();
        Booking booking = bookings.getBookingID(id);
        String tutorEmail = booking.getTutorEmail();
        Tutors tutors = getTutorCache().getTutors();
        Tutor tutor = tutors.getTutorByEmail(tutorEmail);
        booking.setBookingStatus("cancelled");
        tutor.setStatus("Available");
        getBookingCache().updateXML(bookings, "WEB-INF/bookings.xml");
        getTutorCache().saveTutors();
    }
    
////    @WebMethod()
////    public String filterBookingsByName() {
////        
////    }

}


package wsdpackage;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings implements Serializable {
    @XmlElement(name = "name")
    private String name;
    
    @XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();
    
    public ArrayList<Booking> getList() {
        return list;
    }
    
    public void addBooking(Booking booking) {
        list.add(booking);
    }
    
    public void removeBooking(Booking booking) {
        list.remove(booking);
    }
    
    public Booking getBookingID(int bookingID){
        for (Booking booking : list) {
          if (booking.getBookingID() == (bookingID)){
              return booking;
            }
        }
        return null;
    }
    
    public ArrayList<Booking> getStudentWithEmail(String email) {
        ArrayList<Booking> userWithEmail = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getStudentEmail().equals(email)) {
               userWithEmail.add(booking);
            }
        }
        if (userWithEmail.isEmpty()){
            return null;
        }
        return userWithEmail;
    }
    
    public ArrayList<Booking> getTutorWithEmail(String email) {
        ArrayList<Booking> userWithEmail = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getTutorEmail().equals(email)) {
               userWithEmail.add(booking);
            }
        }
        if (userWithEmail.isEmpty()){
            return null;
        }
        return userWithEmail;
    }
    
    
    public ArrayList<Booking> getSubject(String subject) {
        ArrayList<Booking> subjectList = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getSubject().equals(subject)) {
               subjectList.add(booking);
            }
        }
        if (subjectList.isEmpty()){
            return null;
        }
        return subjectList;
    }
    
    public ArrayList<Booking> getBookingStatus(String bookingStatus) {
        ArrayList<Booking> statusList = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getBookingStatus().equals(bookingStatus)) {
               statusList.add(booking);
            }
        }
        if (statusList.isEmpty()){
            return null;
        }
        return statusList;
    }
    
    // lol i feel like i'm doing this wrong, maybe this should add the booking to XML as well somehow
    public Booking createBooking(int bookingID, String tutorName, String tutorEmail, String subject, String studentName, String studentEmail, String bookingStatus) {
        Booking booking = new Booking(bookingID, tutorName, tutorEmail, subject, studentName, studentEmail, bookingStatus);
        return booking;
    }
      
}

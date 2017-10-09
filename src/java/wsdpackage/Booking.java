package wsdpackage;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
public class Booking implements Serializable {
    
    @XmlElement(name = "bookingID")
    private int bookingID;
    
    @XmlElement(name = "tutorName")
    private String tutorName;
    
    @XmlElement(name = "tutorEmail")
    private String tutorEmail;
    
    @XmlElement(name = "subject")
    private String subject;
    
    @XmlElement(name = "studentName")
    private String studentName;
    
    @XmlElement(name = "studentEmail")
    private String studentEmail;
    
    @XmlElement(name = "bookingStatus")
    private String bookingStatus;
    

    public Booking(int bookingID, String tutorName, String tutorEmail, String subject, String studentName, String studentEmail, String bookingStatus ){
        this.bookingID = bookingID;
        this.tutorName = tutorName;
        this.tutorEmail = tutorEmail;
        this.subject = subject;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.bookingStatus = bookingStatus;   
    }

    public Booking() {
    
    }
    
    
    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    public String getTutorEmail() {
        return tutorEmail;
    }

    public void setTutorEmail(String tutorEmail) {
        this.tutorEmail = tutorEmail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }
    
    
}

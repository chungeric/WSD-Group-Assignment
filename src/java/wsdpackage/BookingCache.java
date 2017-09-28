package wsdpackage;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.*;

public class BookingCache {
    private String filePath;
    private Bookings bookings;
    
    public BookingCache(){}
    
    public BookingCache(String filePath, Bookings bookings){
        this.filePath = filePath;
        this.bookings = bookings;
    }
    
    public String getFilePath() {
        return filePath;
    }
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings)u.unmarshal(fin);
        fin.close();
    }
    
    public void updateXML(Bookings booking, String FilePath) throws Exception {
        this.bookings = booking;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }
    
    public Bookings getBookings(){
        return bookings;
    }
    
    public void setBookings(Bookings bookings){
        this.bookings = bookings;
    }
}

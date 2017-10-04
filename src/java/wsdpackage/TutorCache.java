package wsdpackage;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.*;

public class TutorCache {
    
    private String filePath;
    private Tutors tutors;
    
    public TutorCache() {}
    
    public TutorCache(String filePath, Tutors tutors) {
        this.filePath = filePath;
        this.tutors = tutors;
    }
    
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        FileInputStream fin = new FileInputStream(filePath);
        tutors = (Tutors)u.unmarshal(fin);
        fin.close();
    }
    
    public void updateXML(Tutors tutor, String filePath) throws Exception {
        this.tutors = tutor;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    
    public void saveTutors() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    
    public Tutors getTutors() {
        return tutors;
    }

    public void setTutors(Tutors tutors) {
        this.tutors = tutors;
    }    
    
}

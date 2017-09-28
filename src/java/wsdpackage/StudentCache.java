package wsdpackage;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.*;
 
public class StudentCache {
    
    private String filePath;
    private Students students;
    
    public StudentCache() {}
    
    public StudentCache(String filePath, Students students) {
        this.filePath = filePath;
        this.students = students;
    }
    
    public String getFilePath() {
        return filePath;
    }
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        FileInputStream fin = new FileInputStream(filePath);
        students = (Students)u.unmarshal(fin);
        fin.close();
    }
    
    public void updateXML(Students student, String filePath) throws Exception {
        this.students = student;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
    

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }
       
}

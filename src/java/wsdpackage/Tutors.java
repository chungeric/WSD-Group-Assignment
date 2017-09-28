package wsdpackage;

import java.io.File;
import java.io.FileOutputStream;
import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "tutors")
public class Tutors implements Serializable {
    @XmlElement(name = "name")
    private String name;

    @XmlElement(name = "tutor")
    private ArrayList<Tutor> list = new ArrayList<Tutor>();
 
    public ArrayList<Tutor> getList() {
        return list;
    }
    public void addTutor(Tutor tutor) {
        list.add(tutor);
    }
    public void removeUser(Tutor tutor) {
        list.remove(tutor);
    }
    
    public Tutor checkForDuplicate(String email) {
        // For each tutor in the list...
        for (Tutor tutor : list) {
            //If the provided email matches any email within the list...
            if (tutor.getEmail().equals(email)) {
                return tutor;
            }
        }
        return null;
    }
        
    public Tutor login(String email, String password) {
        // For each user in the list...
        for (Tutor tutor : list) {
            if (tutor.getEmail().equals(email) && tutor.getPassword().equals(password))
                return tutor; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    public ArrayList<Tutor> getTutorStatus(String status) {
        ArrayList<Tutor> tutorStatusList = new ArrayList<>();
        for (Tutor tutor: list) {
            if (tutor.getStatus().equals(status)) {
               tutorStatusList.add(tutor);
            }
        }
        return tutorStatusList;
    }
    
    public Tutor getTutorEmail(String email) {
        for (Tutor tutor: list) {
            if (tutor.getEmail().equals(email)) {
                return tutor;
            }
        }
        return null;
    }
    
    public ArrayList<Tutor> getTutorsByStatus(String status) {
        ArrayList<Tutor> tutorList = new ArrayList<>();
        for (Tutor tutor: list) {
            if (tutor.getStatus().equals(status)) {
               tutorList.add(tutor);
            }
        }
        if (tutorList.isEmpty()) {
            return null;
        }
        return tutorList;
    }
    
    public ArrayList<Tutor> getTutorsBySubject(String subject) {
        ArrayList<Tutor> tutorList = new ArrayList<>();
        for (Tutor tutor: list) {
            if (tutor.getSubject().equals(subject)) {
               tutorList.add(tutor);
            }
        }
        if (tutorList.isEmpty()) {
            return null;
        }
        return tutorList;
    }
    
    public ArrayList<Tutor> getTutorsByName(String name) {
        ArrayList<Tutor> tutorList = new ArrayList<>();
        for (Tutor tutor: list) {
            if (tutor.getName().equals(name)) {
               tutorList.add(tutor);
            }
        }
        if (tutorList.isEmpty()) {
            return null;
        }
        return tutorList;
    }
    
    public void writeXMLFile(ArrayList<Tutor> tutors) {
        try {
            StreamSource xmlSource = new StreamSource( new File("WEB-INF/tutors.xml"));
            StreamSource xsltSource = new StreamSource( new File("WEB-INF/tutors.xsl"));
            StreamResult fileResult = new StreamResult(new FileOutputStream("WEB-INF/output.xml"));
            
            TransformerFactory tfFactory = TransformerFactory.newInstance();
            Transformer tf = tfFactory.newTransformer(xsltSource);
            tf.transform(xmlSource, fileResult);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}

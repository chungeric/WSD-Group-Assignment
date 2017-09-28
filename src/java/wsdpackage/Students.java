package wsdpackage;

import javax.xml.bind.annotation.*;
import java.util.*;
import java.io.Serializable;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "students")
public class Students implements Serializable {
    @XmlElement(name = "name")
    private String name;

    @XmlElement(name = "student")
    private ArrayList<Student> list = new ArrayList<Student>();
 
    public ArrayList<Student> getList() {
        return list;
    }
    public void addStudent(Student student) {
        list.add(student);
    }
    public void removeUser(Student student) {
        list.remove(student);
    }
    
    public Student checkForDuplicate(String email) {
        for (Student student : list) {
            if (student.getEmail().equals(email)) {
                return student;
            }
        }
        return null;
    }
    
    public Student login(String email, String password) {
        // For each user in the list...
        for (Student student : list) {
            if (student.getEmail().equals(email) && student.getPassword().equals(password))
                return student; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
}
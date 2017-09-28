package wsdpackage;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
public class Tutor implements Serializable {
    
    @XmlElement(name = "name")
    private String name;
    
    @XmlElement(name = "email")
    private String email;
    
    @XmlElement(name = "password")
    private String password;
    
    @XmlElement(name = "dob")
    private String dob;
    
    @XmlElement(name = "userType")
    private String userType;
    
    @XmlElement(name = "subject")
    private String subject;
    
    @XmlElement(name = "status")
    private String status;
    
    public Tutor() {}

    public Tutor(String name, String email, String password, String dob, String userType, String subject, String status) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.userType = userType;
        this.subject = subject;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}

package wsdpackage;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class DataValidator {
  
    // Just grabbed regular expressions from the xml schemas
    private String nameRegex = "([A-Z][a-z]+\\s)+([A-Z][a-z]+)";
    //private String emailRegex = "[a-zA-Z\\._]+[@]([a-z-]+)([\\.][a-z-]+)+";
    private String emailRegex = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-z]{2,4}"; //This is from tutor video
    private String passwordRegex = ".{6,}";
    private String dobRegex = "\\d{1,4}-\\d{1,2}-\\d{1,2}";
    //private String subjectRegex = "[A-Z][a-z]+[A-Z][a-z]";
 
    public DataValidator() {}
    
    public boolean validate(String pattern, String input) {
        Pattern regex = Pattern.compile(pattern);
        Matcher match = regex.matcher(input);
        return match.matches();
    }
    
    public boolean validateName(String name) {
        return validate(nameRegex, name);
    }
    
    public boolean validateEmail(String email) {
        return validate(emailRegex, email);
    }
    
    public boolean validatePassword(String password) {
        return validate(passwordRegex, password);
    }
    
    public boolean validateDob(String dob) {
        return validate(dobRegex, dob);
    }
    
    public boolean validateSubject(String subject) {
        return subject.equals("WSD") || subject.equals("USP") || subject.equals("SEP") || subject.equals("AppProg") || subject.equals("MobileApp");
    }
    
    /*public boolean isEmpty(String name, String email, String password, String dob) {
        if (name == "" || email == "" || password == "" || dob == "") {
            return true;
        }
        return false;
    }*/
}

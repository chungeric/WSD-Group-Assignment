package wsdpackage;
import java.util.*;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class DataValidator {
  
    // Just grabbed regular expressions from the xml schemas
    private String nameRegex = "([A-Z][a-z]+\\s)+([A-Z][a-z]+)";
    private String emailRegex = "[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-z]{2,4}"; //This is from tutor video
    private String passwordRegex = ".{6,}";
    private String dobRegex = "\\d{4}-\\d{2}-\\d{2}";
 
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
        
        // Get today's date, and subtract 16 years from the current year
        Calendar currentDate = Calendar.getInstance();
        currentDate.add(Calendar.YEAR,-16);
        
        int sixteenYearsAgo = currentDate.get(Calendar.YEAR);
        String userYear = dob.substring(0,4);
        
        // If the year the user inputted is greater or equal to the year sixteen years ago...
        // ... They are too young to be a typical uni student/tutor
        
        if (Integer.parseInt(userYear) >= sixteenYearsAgo) {
            return false;
        }
        else {
            return validate(dobRegex, dob);
        }
    }
    
    public boolean validateSubject(String subject) {
        return subject.equals("WSD") || subject.equals("USP") || subject.equals("SEP") || subject.equals("AppProg") || subject.equals("MobileApp");
    }

}

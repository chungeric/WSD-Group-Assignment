package uts.wsd.rest;
 
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import uts.wsd.*;
import wsdpackage.*;
import java.util.*;


/**
 *      http://localhost:8080/WSD-Group-Assignment/rest/tutor/status/Available   to search
 */

@Path("/tutor")
public class TutorService {
    
 @Context
 private ServletContext application;
 
 private TutorCache getAllTutors() throws JAXBException, IOException, Exception {
    synchronized (application) {
    TutorCache tutors = (TutorCache)application.getAttribute("tutors");
    if (tutors == null) {
        tutors= new TutorCache();
        tutors.setFilePath(application.getRealPath("WEB-INF/tutors.xml"));
        application.setAttribute("tutors", tutors);
    }
    return tutors;
    }
 }
 
    @Path("alltutors")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Tutors getUsers() throws IOException, Exception {
       return getAllTutors().getTutors();
    }
 
    @Path("status/{status}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Tutor> getTutorStatus(@PathParam("status") String status) throws Exception{
        return getAllTutors().getTutors().getTutorsByStatus(status);
    }
    
    @Path("email/{email}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Tutor getTutorEmail(@PathParam("email") String email) throws Exception{
        return getAllTutors().getTutors().getTutorByEmail(email);
    }
    
    
}

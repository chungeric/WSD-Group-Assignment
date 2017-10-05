<%@ page import="wsdpackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/accountStyle.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <title>WSD - Assignment 1: Account Page for Students</title>
    </head>
    <body>
        <%  
            // ROUTE PROTECTION
            if (session.getAttribute("student")!=null || session.getAttribute("tutor")!=null) {
        %>

        <%          
            // Grab the student data stored in the java bean
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            
            String nameErrorMsg = (String) session.getAttribute("nameErrorMsg");
            String passwordErrorMsg = (String) session.getAttribute("passwordErrorMsg");
            String dobErrorMsg = (String) session.getAttribute("dobErrorMsg");
            String detailsErrorMsg = (String) session.getAttribute("detailsErrorMsg");

            
            if (nameErrorMsg == null || passwordErrorMsg == null || dobErrorMsg == null || detailsErrorMsg == null) {
                nameErrorMsg = "";
                passwordErrorMsg = "";
                dobErrorMsg = "";
                detailsErrorMsg = "";
            }
        %>
        
            
            <div id="editBkg" onClick="removeEditMode()">
            </div>
            <div id="editContent">
            <div id="exit" onClick="removeEditMode()">x</div> 
            <h2>Edit your details:</h2>
            <% if (student!= null) {%>
                    <form method="POST" action="editAccountStudent.jsp">
                            <label>Name:</label> <input type="text" name="name" value="<%=student.getName()%>"> <span class="errorText"><%=nameErrorMsg%></span><br>
                            <label>Password:</label> <input type="password" name="password" value="<%=student.getPassword()%>"> <span class="errorText"><%=passwordErrorMsg%></span><br>
                            <label>Date of Birth:</label> <input type="text" name="dob" value="<%=student.getDob()%>"> <span class="errorText"><%=dobErrorMsg%></span><br>
                            <input type="Submit" value="Submit" class="button">
                    </form>
            </div>
            <% } else { %> 
                        <form method="POST" action="editAccountTutor.jsp">
                            <label>Name:</label> <input type="text" name="name" value="<%=tutor.getName()%>">  <span class="errorText"><%=nameErrorMsg%></span><br>
                            <label>Password:</label> <input type="password" name="password" value="<%=tutor.getPassword()%>"> <span class="errorText"><%=passwordErrorMsg%></span><br>
                            <label>Date of Birth:</label> <input type="text" name="dob" value="<%=tutor.getDob()%>"> <span class="errorText"><%=dobErrorMsg%></span><br>
                            <input type="Submit" value="Submit" class="button">
                        </form>
                </div> 
            <% } %>
            
            <div id="topBar">
                <span>
                     <a href="main.jsp" id="logo">UTSTutor</a>
                </span>
            <div id="navBar">
                <a href="account.jsp" class="navLink">My Account</a>
                <a href="bookings.jsp" class="navLink">My Bookings</a>
            </div>
            <a href="logout.jsp" class="logout"><i class="material-icons">exit_to_app</i></a>
            </div>
            
            <div id="content">
            <%
                // user is a student, display this
                if(student != null) {
            %>
            <h1>Welcome <%=student.getName()%>!</h1>
            <h2>Here are your details:</h2>
            <span class="errorText"><%=detailsErrorMsg%></span><br>
            <span id="editMode" onClick="editMode()">Edit details <i class="material-icons">mode_edit</i></span><br>
            <form method="POST" action="cancelAccountAction.jsp">
                <table>
                    <tr>
                        <td><b>Name:</b></td> 
                        <td><%=student.getName()%><br></td>
                    </tr>
                    <tr>
                        <td><b>Email:</b></td>
                        <td><%=student.getEmail()%><br></td>
                    </tr>
                    <tr>
                        <td><b>Date of Birth:</b></td>
                        <td><%=student.getDob()%><br></td> 
                    </tr>
                    <tr>
                        <td><b>User Type:</b></td>
                        <td><%=student.getUserType()%><br></td>
                    </tr>
                    <tr>
                        <td><input type="Submit" value="Cancel Account" class="button"</td>
                    </tr>
                </table>
            </form>
  

            <%
                // user is a tutor, display this instead
                } else {
             %>
                    <h1>Welcome <%=tutor.getName()%>!</h1>
                    <h2>Here are your details:</h2>
                    <span class="errorText"><%=detailsErrorMsg%></span><br>
                    <span id="editMode" onClick="editMode()">Edit details <i class="material-icons">mode_edit</i></span><br>
                    <form method="POST" action="cancelAccountAction.jsp">
                        <table>
                            <tr>
                                <td><b>Name:</b></td>
                                <td><%=tutor.getName()%><br></td>
                            </tr>
                            <tr>
                                <td><b>Email:</b></td>
                                <td><%=tutor.getEmail()%><br></td>
                            </tr>
                            <tr>
                                <td><b>Date of Birth:</b></td>
                                <td><%=tutor.getDob()%><br></td>
                            </tr>
                            <tr>
                                <td><b>User Type:</b></td> 
                                <td><%=tutor.getUserType()%><br></td>
                            </tr>
                            <tr>
                                <td><b>Subject of specialty:</b></td>
                                <td><%=tutor.getSubject()%><br></td>
                            <tr>    
                                <td><b>Status:</b></td>
                                <td><%=tutor.getStatus()%><br></td>
                            </tr>
                            <tr>
                                <td><input type="Submit" value="Cancel Account" class="button"</td>
                              </tr>
                        </table>
                    </form>
            <%
                }
             %>      
             
        </div>            
                    
        <%  
            // ROUTE PROTECTION
            } else {
                // user not logged in
                response.sendRedirect("index.jsp");
            }
        %>
        <script src="JavaScript/accountStudentJS.js"></script>
    </body>
</html>
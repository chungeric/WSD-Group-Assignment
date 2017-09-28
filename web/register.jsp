<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/register.css">
        <title>WSD - Assignment 1: Initial Register Page</title>
    </head>
    <body>
        
        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
        </div>
        <div id="content">
            <h1>Register</h1>
            
                <%
                    String specialtyErr = (String) session.getAttribute("specialtyErr");
                    if(specialtyErr != null) {
                %>
                <span class="warning">
                    <%=specialtyErr%>
                </span>
                <% } %>
            
            <form method="POST" action="registerAction.jsp">
                <table>
                    <tr>
                        <td>Full Name:</td>
                        <td><input type="text" name="name" placeholder="e.g. John Smith"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" placeholder="e.g. johnsmith@email.com"></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><input type="date" name="dob"></td>
                    </tr>
                    <tr>
                        <td>User Type:</td>
                        <td>
                            <select id="userType" name="userType">
                                <option value="Student" selected>Student</option>
                                <option value="Tutor">Tutor</option>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td><span id="subjectlabel" style="visibility:hidden">Subject of Specialty:</span></td>
                        <td>
                            <select id="subject" name="subject" style="visibility:hidden">
                                <option value="">Please select your subject of specialty</option>
                                <option>WSD</option>
                                <option>USP</option>
                                <option>SEP</option>
                                <option>AppProg</option>
                                <option>MobileApp</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="Submit" value="Submit" class="button"></td>
                    </tr>
                    <!--
                    <label>Full Name:</label> <input type="text" name="name" placeholder="e.g. John Smith"><br>
                    <label>Email:</label> <input type="text" name="email" placeholder="e.g. johnsmith@email.com"><br>
                    <label>Password:</label> <input type="password" name="password"> <br>
                    <label>Date of birth:</label> <input type="text" name="dob" placeholder="e.g. DD/MM/YYYY"><br>
                    <label>User type:</label>
                        <select id="userType" name="userType">
                            <option value="Student" selected>Student</option>
                            <option value="Tutor">Tutor</option>
                        </select>                    
                    <br>
                    <input type="Submit" value="Submit" class="button">
                    -->
                    
                </table>
            </form>                     

        </div>
    
    <script src="JavaScript/register.js"></script>
    </body>
</html>
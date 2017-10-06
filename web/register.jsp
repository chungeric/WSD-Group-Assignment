<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/register.css">
        <title>WSD - Assignment 1: Register Page</title>
    </head>
    <body>
        <%
            String nameErrorMsg = (String) session.getAttribute("nameErrorMsg");
            String emailErrorMsg = (String) session.getAttribute("emailErrorMsg");
            String passwordErrorMsg = (String) session.getAttribute("passwordErrorMsg");
            String dobErrorMsg = (String) session.getAttribute("dobErrorMsg");
            String subjectErrorMsg = (String) session.getAttribute("subjectErrorMsg");
            String existRegisterErrorMsg = (String) session.getAttribute("existRegisterErrorMsg");

            if (nameErrorMsg == null || emailErrorMsg == null || passwordErrorMsg == null || dobErrorMsg == null || subjectErrorMsg == null || existRegisterErrorMsg == null) {
                nameErrorMsg = "";
                emailErrorMsg = "";
                passwordErrorMsg = "";
                dobErrorMsg = "";
                subjectErrorMsg = "";
                existRegisterErrorMsg = "";
            }
            if (session.getAttribute("student") == null && session.getAttribute("tutor") == null) {
        %>

        <div id="topBar">
            <span>
                <a href="index.jsp" id="logo">UTSTutor</a>
            </span>
        </div>
        <div id="content">
            <h1>Register</h1>
            <span class="note">Note: You must be at least seventeen years old to register</span>
            <form method="POST" action="registerAction.jsp">
                <input type="hidden" name="formCheck" value="check">
                <table>
                    <tr>
                        <td>Full Name:</td>
                        <td><input type="text" name="name" placeholder="e.g. John Smith"></td>
                        <td><span class="errorText"><%=nameErrorMsg%></span></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" placeholder="e.g. johnsmith@email.com"></td>
                        <td><span class="errorText"><%=emailErrorMsg%></span></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password"><span class="errorText"></span></td>
                        <td><span class="errorText"><%=passwordErrorMsg%></span></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><input type="date" name="dob"><span class="errorText"></span></td>
                        <td><span class="errorText"><%=dobErrorMsg%></span></td>
                    </tr>
                    <tr>
                        <td>User Type:</td>
                        <td>
                            <select id="userType" name="userType">
                                <option value="Student" selected>Student</option>
                                <option value="Tutor">Tutor</option>
                            </select>
                            <span class="errorText"><%=existRegisterErrorMsg%></span><span class="errorText"><%=subjectErrorMsg%></span>
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
                </table>
            </form>                     

        </div>


        <%
                // ROUTE PROTECTION
            } else {
                response.sendRedirect("main.jsp");
            }
        %>
        <script src="JavaScript/register.js"></script>
    </body>
</html>
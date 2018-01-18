<%@page import="com.unisoft.model.DBManager"%>
<%@page import="com.unisoft.model.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
        response.sendRedirect("../login.jsp");
    } else {
%>
<%
    if (request.getMethod().equals("POST")) {
        String examName = request.getParameter("examName");
        String description = request.getParameter("description");
        Exam exam = new Exam(examName, description);
        DBManager.addExam(exam);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Testing : Admin Home</title>
        <meta name="Keywords" content="" />
        <meta name="Description" content="" />
        <link href="../css/default.css" rel="stylesheet" type="text/css" />
        <style>
            #colTwo{
                width: 1072px;
            }
        </style>
    </head>
    <body>
        <div id="header">
            <h1>Online Testing</h1>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="view_reports.jsp">Reports</a></li>
                <li><a href="changepassword.jsp">Change Password</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </div>
        <div id="content">
            <div id="colTwo">
                <div class="bg2">
                    <h2>Available Exams</h2>
                    <hr>
                    <table style="float: left;" cellpadding="5px">
                        <%
                            ArrayList<Exam> list = DBManager.getAllExams();
                            for (Exam exam : list) {
                        %>
                        <tr>  
                            <td><%= exam.getExamName()%></td>
                            <td><a class="link-style" href="edit_exam.jsp?examName=<%= exam.getExamName()%>">Edit Exam</a></td>
                            <td><a class="link-style" href="manage_test.jsp?examName=<%= exam.getExamName()%>">Manage Tests</a></td>
                        </tr>
                        <% } %>
                    </table>
                    <form style="float: right;width: 450px" action="index.jsp" method="POST">
                        <fieldset>
                            <legend>Add New Exam</legend>
                            <table border="0" cellpadding="10">
                                <tbody>
                                    <tr>
                                        <td>Exam Name : </td>
                                        <td><input type="text" name="examName" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Description : </td>
                                        <td><textarea name="description" rows="6" cols="35"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <input type="submit" name="submit" value="Add Exam" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% }%>


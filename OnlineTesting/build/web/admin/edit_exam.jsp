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
        DBManager.updateExam(exam);
        response.sendRedirect("index.jsp");
    } else {
        String examName = request.getParameter("examName");
        Exam exam = DBManager.getExam(examName);
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
                    <form style="width: 450px" action="edit_exam.jsp" method="POST">
                        <fieldset>
                            <legend>Edit Exam</legend>
                            <table border="0" cellpadding="10">
                                <tbody>
                                    <tr>
                                        <td>Exam Name : </td>
                                        <td><input type="text" name="examName" readonly value="<%= exam.getExamName()%>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Description : </td>
                                        <td><textarea name="description" rows="6" cols="35"><%= exam.getDescription()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <input type="submit" name="submit" value="Update Exam" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="button" value="Cancel Update" onclick="history.go(-1)" />
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
<% }
    }%>


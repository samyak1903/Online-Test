<%@page import="com.unisoft.model.*"%>
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
    String examName = "";
    if (request.getMethod().equals("POST")) {
        examName = request.getParameter("examName");
        String testName = request.getParameter("testName");
        String description = request.getParameter("description");
        int numberOfQuestions = Integer.parseInt(request.getParameter("numberOfQuestions"));
        double passPercentage = Double.parseDouble(request.getParameter("passPercentage"));
        Test test = new Test(examName, testName, description, numberOfQuestions, passPercentage);
        DBManager.addTest(test);
    }
    examName = request.getParameter("examName");
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
                    <h2>Available Tests in <%= examName%></h2>
                    <hr>
                    <table style="float: left;" cellpadding="5px">
                        <%
                            ArrayList<Test> list = DBManager.getAllTests(examName);
                            for (Test test : list) {
                        %>
                        <tr>  
                            <td><%= test.getTestName()%></td>
                            <td><a class="link-style" href="edit_test.jsp?id=<%= test.getId()%>">Edit Test</a></td>
                            <td><a class="link-style" href="manage_questions.jsp?id=<%= test.getId()%>">Manage Questions</a></td>
                        </tr>
                        <% }%>
                    </table>
                    <form style="float: right;width: 500px" action="manage_test.jsp" method="POST">
                        <fieldset>
                            <legend>Add New Test</legend>
                            <table border="0" cellpadding="10">
                                <tbody>
                                    <tr>
                                        <td>Test Name : </td>
                                        <td><input type="text" name="testName" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Description : </td>
                                        <td><textarea name="description" rows="6" cols="35"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Number Of Questions : </td>
                                        <td><input type="text" name="numberOfQuestions" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Pass Percentage : </td>
                                        <td><input type="text" name="passPercentage" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <input type="submit" name="submit" value="Add Test" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="examName" value="<%= examName%>"
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


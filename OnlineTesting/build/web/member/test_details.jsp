<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Testing : Select an Exam</title>
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
                <li><a href="select_exam.jsp">Exam</a></li>
                <li><a href="changepassword.jsp">Change Password</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </div>
        <div id="content">
            <div id="colTwo">
                <div class="bg2" style="min-height: 350px;">
                    <h2>Select a Test</h2>
                    <hr>
                        <table width="100%" cellpadding="10px">
                        <%
                            Test test = DBManager.getTest(id);
                        %> 
                            <table border="0" cellpadding="10">
                                <tbody>
                                    <tr>
                                        <td>Test Name : </td>
                                        <td><%= test.getTestName()%></td>
                                    </tr>
                                    <tr>
                                        <td>Description : </td>
                                        <td><%= test.getDescription()%></td>
                                    </tr>
                                    <tr>
                                        <td>Number Of Questions : </td>
                                        <td><%= test.getNumberOfQuestions()%></td>
                                    </tr>
                                    <tr>
                                        <td>Pass Percentage : </td>
                                        <td><%= test.getPassPercentage()%></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <a class="link-style" href="test.jsp?id=<%= id%>">Start Test</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="button" onclick="history.go(-1)" value="Go Back">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        <% 
                            
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% }%>


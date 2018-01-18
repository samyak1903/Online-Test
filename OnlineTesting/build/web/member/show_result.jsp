<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
%>
<%
    String userName = session.getAttribute("userName").toString();
    String name = session.getAttribute("name").toString();
    Test test = (Test) session.getAttribute("test");
    ArrayList<Question> paper = (ArrayList<Question>) session.getAttribute("paper");
    String[] answers = (String[]) session.getAttribute("answers");
    /* Evaluate the Test Paper */
    int correct = 0;
    int attempted = 0;
    for (int i = 0; i < paper.size(); i++) {
        if (answers[i].equals(paper.get(i).getCorrectOption())) {
            correct++;
        }
        if (!answers[i].equals("")) {
            attempted++;
        }
    }
    double score = (correct * 100) / paper.size();
    String result = "PASS";
    if (test.getPassPercentage() > score) {
        result = "FAIL";
    }
    Report r = new Report();
    r.setUserName(userName);
    r.setExamName(test.getExamName());
    r.setTestName(test.getTestName());
    r.setDateOfExam(new java.util.Date());
    r.setScore(score);
    r.setResult(result);
    DBManager.addReport(r);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Testing : Test in Progress</title>
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
        </div>
        <div id="content">
            <div id="colTwo">
                <div class="bg2">
                    <table cellpadding="10px" width="50%">
                        <tr>
                            <td>Date : </td>
                            <td><%= DateConverter.toString(new java.util.Date())%> </td>
                        </tr>
                        <tr>
                            <td>Name : </td>
                            <td><%= name%></td>
                        </tr>
                        <tr>
                            <td>Exam Name : </td>
                            <td><%= test.getExamName()%></td>
                        </tr>
                        <tr>
                            <td>Test Name : </td>
                            <td><%= test.getTestName()%></td>
                        </tr>
                        <tr>
                            <td>Number of Questions : </td>
                            <td><%= test.getNumberOfQuestions()%></td>
                        </tr>
                        <tr>
                            <td>Attempted : </td>
                            <td><%= attempted%> </td>
                        </tr>
                        <tr>
                            <td>Correct Answers : </td>
                            <td><%= correct%> </td>
                        </tr>
                        <tr>
                            <td>Score : </td>
                            <td><%= String.format("%.2f", score)%> % </td>
                        </tr>
                        <tr>
                            <td>Result : </td>
                            <td><%= result%> </td>
                        </tr>
                    </table>
                        <p>
                            <input type="button" value="Print Result" onclick="window.print()">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="link-style" href="index.jsp">Members's Home</a>       
                        </p>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% 
    session.removeAttribute("test");
    session.removeAttribute("paper");
    session.removeAttribute("answers");
    session.removeAttribute("index");
    
    }
%>


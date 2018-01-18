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
    int testId = Integer.parseInt(request.getParameter("id"));
    if (request.getMethod().equals("POST")) {
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");
        Question q = new Question(testId, questionText, optionA, optionB, optionC, optionD, correctOption);
        DBManager.addQuestion(q);
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
            #questions
            {
                width: 100%;
            }
            #questions th,#questions td
            {
                text-align: center;
                padding: 15px;
                font-size: 1.1em;
            }
            #questions,#questions th,#questions td
            {
                border: 1px solid silver;
                border-collapse: collapse;
            }
            .highlight
            {
                background-color: silver;
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
                    <form style="width:600px" action="manage_questions.jsp?id=<%= testId%>" method="POST">
                        <fieldset>
                            <legend>Add New Question</legend>
                            <table border="0" cellpadding="10">
                                <tbody>
                                    <tr>
                                        <td>Question Text : </td>
                                        <td><textarea name="questionText" rows="6" cols="50"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Option A : </td>
                                        <td><input type="text" name="optionA" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Option B : </td>
                                        <td><input type="text" name="optionB" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Option C : </td>
                                        <td><input type="text" name="optionC" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Option D : </td>
                                        <td><input type="text" name="optionD" required value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Correct Option: </td>
                                        <td>
                                            <select name="correctOption">
                                                <option>A</option>
                                                <option>B</option>
                                                <option>C</option>
                                                <option>D</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <input type="submit" name="submit" value="Add Question" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </form>
                    <hr>
                    <%
                        ArrayList<Question> list = DBManager.getAllQuestions(testId);
                    %>
                    <% if (list.size() == 0) { %>
                    <h2>There are no question in this Test. Please add some questions.</h2>
                    <% } else {%>
                    <table id="questions">
                        <thead>
                            <tr class="highlight">
                                <th width="5%">S.No.</th>
                                <th width="40%">Question Text</th>
                                <th width="10%">Option A</th>
                                <th width="10%">Option B</th>
                                <th width="10%">Option C</th>
                                <th width="10%">Option D</th>
                                <th width="5%">Correct Option</th>
                                <th width="10%">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 1;
                                for (Question q : list) {
                            %>
                            <tr <% if (i % 2 == 0) {%> class="highlight" <% }%>>
                                <td><%= i %></td>
                                <td><%= q.getQuestionText() %></td>
                                <td><%= q.getOptionA() %></td>
                                <td><%= q.getOptionB() %></td>
                                <td><%= q.getOptionC() %></td>
                                <td><%= q.getOptionD() %></td>
                                <td><%= q.getCorrectOption() %></td>
                                <td>
                                    <a href="edit_question.jsp?id=<%= q.getId() %>"><img src="../images/b_edit.png" alt=""/></a>   
                                    /
                                    <a href="delete_question.jsp?id=<%= q.getId() %>" onclick="return confirm('Are you sure')"><img src="../images/b_drop.png" alt=""/></a>
                                </td>
                            </tr>
                            <%  i++;
                                }
                            %>
                        </tbody>
                    </table>                
                    <% } %>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% }%>


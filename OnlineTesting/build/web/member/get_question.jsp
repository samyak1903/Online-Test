<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%
    String userName = session.getAttribute("userName").toString();
    String name = session.getAttribute("name").toString();
    Test test = (Test) session.getAttribute("test");
    ArrayList<Question> paper = (ArrayList<Question>) session.getAttribute("paper");
    int index = (int) session.getAttribute("index");

    String[] answers = (String[]) session.getAttribute("answers");
    if(request.getParameter("value")==null){
        
    }
    else if (request.getParameter("value").equals("next")) {
        if (request.getParameter("answer") != null) {
            answers[index] = request.getParameter("answer");
        }
        index++;
        session.setAttribute("index", index);
    } else if (request.getParameter("value").equals("previous")) {
        if (request.getParameter("answer") != null) {
            answers[index] = request.getParameter("answer");
        }
        index--;
        session.setAttribute("index", index);
    } else if (request.getParameter("value").equals("finish")) {
        if (request.getParameter("answer") != null) {
            answers[index] = request.getParameter("answer");
        }
        response.sendRedirect("show_result.jsp");
    }
    Question q = paper.get(index);
    String ans = answers[index];
%>
<table cellpadding="7px" width="100%">
    <tr>
        <td align="left">Name : <%= name%></td>
        <td align="right">Date : <%= DateConverter.toString(new java.util.Date())%></td>
    </tr>
    <tr>
        <td align="left">Exam Name : <%= test.getExamName()%></td>
        <td align="right">Test Name : <%= test.getTestName()%></td>
    </tr>
    <tr>
        <td colspan="2" align="center">Number of Questions : <%= test.getNumberOfQuestions()%></td>
    </tr>
</table>
<hr>
<table cellpadding="7px" width="100%">
    <tr>
        <td>Q.No. <%= index + 1%> </td>
    </tr>
    <tr>
        <td><%= q.getQuestionText()%> </td>
    </tr>
    <tr>
        <td><input type="radio" name="answer" <% if (ans.equals("A")) {%> checked="checked" <% }%> value="A" /><%= q.getOptionA()%> </td>
    </tr>
    <tr>
        <td><input type="radio" name="answer" <% if (ans.equals("B")) {%> checked="checked" <% }%> value="B" /><%= q.getOptionB()%> </td>
    </tr>
    <tr>
        <td><input type="radio" name="answer" <% if (ans.equals("C")) {%> checked="checked" <% }%> value="C" /><%= q.getOptionC()%> </td>
    </tr>
    <tr>
        <td><input type="radio" name="answer" <% if (ans.equals("D")) {%> checked="checked" <% }%> value="D" /><%= q.getOptionD()%> </td>
    </tr>
    <tr>
        <td>
            <%
                if (index == 0) {
            %>
            <input type="button" value="Next Question" name="next" onclick="loadQuestion('next')" />                                                                
            <% } else if (index > 0 && index < paper.size() - 1) { %>
            <input type="button" value="Previous Question" name="previous" onclick="loadQuestion('previous')" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Next Question" name="next" onclick="loadQuestion('next')" />
            <% } else { %>
            <input type="button" value="Previous Question" name="previous" onclick="loadQuestion('previous')" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="Finish Test" name="finish" onclick="loadQuestion('finish')" />    
            <% } %>
        </td>
    </tr>
</table>
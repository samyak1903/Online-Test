<%@page import="java.util.Collections"%>
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
        Test test = DBManager.getTest(id);
        ArrayList<Question> paper = DBManager.getAllQuestions(id);
        Collections.shuffle(paper);
        session.setAttribute("test", test);
        session.setAttribute("paper", paper);
        session.setAttribute("index", 0);
        int x = test.getNumberOfQuestions();
        String[] answers = new String[x];
        for(int i=0;i<x;i++){
            answers[i] = "";
        }
        session.setAttribute("answers", answers);
        response.sendRedirect("conduct_test.jsp");
    }
%>
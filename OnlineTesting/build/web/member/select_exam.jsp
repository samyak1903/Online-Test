<%@page import="com.unisoft.model.DBManager"%>
<%@page import="com.unisoft.model.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        
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
                    <h2>Select an Exam</h2>
                    <hr>
                        <table width="100%" cellpadding="10px">
                        <%
                            int i=1;                            
                            ArrayList<Exam> list = DBManager.getAllExams();
                            int count = list.size();
                            for (Exam exam : list) {
                                if(i%4==1){
                                    out.println("<tr>");
                                }
                        %> 
                            <td><a class="link-style" href="select_test.jsp?examName=<%= exam.getExamName()%>"><%= exam.getExamName()%></a></td>
                        <% 
                            if(i%4==0){
                                out.println("</tr>");
                            }
                            i++;
                            } 
                            i--;
                            if(i%4!=0){
                                while(i%4!=0){
                                    out.println("<td>&nbsp;</td>");
                                    i++;
                                }
                                out.println("</tr>");
                            }
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


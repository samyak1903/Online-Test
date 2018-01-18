<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String startDate="",endDate="";
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
        response.sendRedirect("../login.jsp");
    } else {
        ArrayList<Report> list = null;
        if(request.getMethod().equals("POST")){
            startDate = request.getParameter("startDate");
            endDate = request.getParameter("endDate");
            list = DBManager.getAllReports(startDate,endDate);
        }else{
            list = DBManager.getAllReports();
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Testing : Reports Page</title>
        <meta name="Keywords" content="" />
        <meta name="Description" content="" />
        <link href="../css/smoothness/jquery-ui-1.9.2.custom.css" rel="stylesheet">
        <script src="../js/jquery-1.8.3.js"></script>
        <script src="../js/jquery-ui-1.9.2.custom.js"></script>
        <script>
        $(function() {
            $( "#datepicker1" ).datepicker({
                    inline: true, dateFormat: 'd-M-yy'
            });
            $( "#datepicker2" ).datepicker({
                    inline: true, dateFormat: 'd-M-yy'
            });
        });
        </script>          
        <link href="../css/default.css" rel="stylesheet" type="text/css" />
        <style>
            #colTwo{
                width: 1072px;
            }
            #reports
            {
                width: 100%;
            }
            #reports th,#reports td
            {
                text-align: center;
                padding: 15px;
                font-size: 1.1em;
            }
            #reports,#reports th,#reports td
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
                <div class="bg2" style="min-height: 350px;">
                    <h2>Test Report</h2>
                    <hr>
                    <form action="view_reports.jsp" method="post">
                        Filter Reports :
                        Start Date : 
                        <input type="text" id="datepicker1" readonly value="<%= startDate%>"  name="startDate" />
                        End Date : 
                        <input type="text" id="datepicker2" readonly value="<%= endDate%>"   name="endDate" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" name="filter" value="Filter Reports" />
                    </form>
                    <hr>
                    <%
                        
                    %>
                    <% if (list.size() == 0) { %>
                    <h2>There are no reports yet.</h2>
                    <% } else {%>
                    <table id="reports">
                        <thead>
                            <tr class="highlight">
                                <th>S.No.</th>
                                <th>User Name</th>
                                <th>Exam Name</th>
                                <th>Test Name</th>
                                <th>Date Of Exam</th>
                                <th>Score</th>
                                <th>Result</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 1;
                                for (Report r : list) {
                            %>
                            <tr <% if (i % 2 == 0) {%> class="highlight" <% }%>>
                                <td><%= i %></td>
                                <td><%= r.getUserName() %></td>
                                <td><%= r.getExamName() %></td>
                                <td><%= r.getTestName() %></td>
                                <td><%= DateConverter.toString(r.getDateOfExam()) %></td>
                                <td><%= r.getScore() %> %</td>
                                <td><%= r.getResult() %></td>
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


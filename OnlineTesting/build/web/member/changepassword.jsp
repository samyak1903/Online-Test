<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Member")) {
        response.sendRedirect("../login.jsp");
    } else {
        boolean status = false;
        int template = 1;
        if(request.getMethod().equals("POST")){
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            if(!password.equals(cpassword)){
                status=true;
            }else{
                DBManager.changePassword(session.getAttribute("userName").toString(),password);
                template=2;
            }
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Testing : Member Home</title>
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
            <div id="colTwo" style="min-height: 400px;">
                <% if(template==1) { %>
                <form style="width: 400px" action="changepassword.jsp" method="POST">
                    <fieldset>
                        <legend>Change Password Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>New Password : </td>
                                <td><input type="password" name="password" required value="" /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password : </td>
                                <td><input type="password" name="cpassword" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Change Password" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(status) {%>
                <h2 style="color: red;">The Passwords do not match.</h2>
                <% } %>
                <% } %>
                <% if(template==2) { %>
                <h2>Your password has been updated.</h2>
                <% } %>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% }%>


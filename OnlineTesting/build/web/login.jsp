<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean error=false;
    if(request.getMethod().equals("POST")){
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        UserInfo info = DBManager.loginUser(userName, password);
        if(info==null){
            error=true;
        }else{
            session.setAttribute("userName", info.getUserName());
            session.setAttribute("roleName", info.getRoleName());
            session.setAttribute("name", info.getName());
            if(info.getRoleName().equals("Member")){
                response.sendRedirect("member/index.jsp");
            }else if(info.getRoleName().equals("Admin")){
                response.sendRedirect("admin/index.jsp");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Online Testing : Home</title>
	<meta name="Keywords" content="" />
	<meta name="Description" content="" />
	<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header">
	<h1>Online Testing</h1>
	<ul>
		<li><a href="index.jsp">Homepage</a></li>
		<li><a href="login.jsp">Login</a></li>
		<li><a href="register.jsp">Register</a></li>
		<li><a href="about.jsp">About</a></li>
	</ul>
</div>
<div id="content">
	<div id="colOne">
		<h3>Available Exams</h3>
		<div class="bg1">
			<ul>
                            <% 
                                ArrayList<Exam> list = DBManager.getAllExams(); 
                                for(Exam exam : list){
                            %>
                            <li><%= exam.getExamName()%></li>
                            <% } %>
			</ul>
		</div>
	</div>
	<div id="colTwo">
            <div style="margin: 100px 0px 0px 100px; ">
		    <form style="width: 400px" action="login.jsp" method="POST">
                    <fieldset>
                        <legend>Login Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td><input type="text" name="userName" required value="alok" /></td>
                            </tr>
                            <tr>
                                <td>Password : </td>
                                <td><input type="password" name="password" required value="abc123" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Login" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(error) {%>
                <h2 style="color: red;">UserName or Password is Incorrect.</h2>
                <% } %>
                <br><br>
                <p>
                    <a class="link-style" href="register.jsp">New User : Sign Up</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="link-style" href="forgotpassword.jsp">Forgot Password</a>
                </p>
                </div>
	</div>
</div>
<div id="footer">
	<p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
</div>
</body>
</html>


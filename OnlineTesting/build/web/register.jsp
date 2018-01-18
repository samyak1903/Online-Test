<%@page import="java.util.ArrayList"%>
<%@page import="com.unisoft.model.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int template=1;
    HashMap<String,String> errors = new HashMap<String,String>();
    String userName = "";
    String password = "";
    String cpassword = "";
    String email = "";
    String name = "";
    String secretQuestion = "";
    String answer = ""; 
    if(request.getMethod().equals("POST")){
        userName = request.getParameter("userName");
        password = request.getParameter("password");
        cpassword = request.getParameter("cpassword");
        email = request.getParameter("email");
        name = request.getParameter("name");
        secretQuestion = request.getParameter("secretQuestion");
        answer = request.getParameter("answer");
        UserInfo info = new UserInfo(userName, password, cpassword, "Member", email, name, secretQuestion, answer);
        errors = ValidationManager.validateUserInfo(info);
        if(errors.size()==0){
            if(DBManager.registerUser(info)){
               // MailManager.sendRegistrationMail(email);
                template=2;
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
                <% if(template==1) { %>
                <form style="width: 600px" action="register.jsp" method="POST">
                    <fieldset>
                        <legend>Registration Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td>
                                    <input type="text" name="userName" value="<%= userName%>" />
                                    <% if(errors.get("userName")!=null){%><span class="error"><%= errors.get("userName")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Password : </td>
                                <td>
                                    <input type="password" name="password" value="<%= password%>" />
                                    <% if(errors.get("password")!=null){%><span class="error"><%= errors.get("password")%></span><% } %>
                                </td>
                            </tr>
                           <tr>
                                <td>Confirm Password : </td>
                                <td>
                                    <input type="password" name="cpassword" value="<%= cpassword%>" >
                                    <% if(errors.get("cpassword")!=null){%><span class="error"><%= errors.get("cpassword")%></span><% } %>
                                </td>
                            </tr> 
                            <tr>
                                <td>E-Mail ID : </td>
                                <td>
                                    <input type="text" name="email" value="<%= email%>" />
                                    <% if(errors.get("email")!=null){%><span class="error"><%= errors.get("email")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Name : </td>
                                <td>
                                    <input type="text" name="name" value="<%= name%>" />
                                    <% if(errors.get("name")!=null){%><span class="error"><%= errors.get("name")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Secret Question : </td>
                                <td>
                                    <textarea name="secretQuestion" rows="4" cols="30"><%= secretQuestion%></textarea>
                                    <% if(errors.get("secretQuestion")!=null){%><span class="error"><br><%= errors.get("secretQuestion")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Answer : </td>
                                <td>
                                    <input type="text" name="answer" value="<%= answer%>" />
                                    <% if(errors.get("answer")!=null){%><span class="error"><%= errors.get("answer")%></span><% } %>
                                </td>
                            </tr>                            
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Register" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% } %>
                <% if(template==2) { %>
                <h2>
                    Congratulations
                    <br>
                    You are successfully registered with OnlineContacts.com. 
                </h2>
                <p>
                    A Mail has been sent to your mail ID. Please click the activation link for unlocking your account.
                    <br><br><br>
                    <a class="link-style" href="login.jsp">Login</a>
                </p>
                <% } %>
	</div>
</div>
<div id="footer">
	<p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
</div>
</body>
</html>


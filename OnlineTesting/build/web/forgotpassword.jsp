<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unisoft.model.*"%>
<%
    int template=1;
    String userName="";
    String secretQuestion = "";
    String errorMessage = "";
    String password = "";
    if(request.getMethod().equals("POST")){
        if(request.getParameter("button1")!=null){
            userName = request.getParameter("userName");
            if(!DBManager.isUserExists(userName)){
                errorMessage = "User Name does not exist";
                template=1;
            }else{
                secretQuestion = DBManager.getSecretQuestion(userName);
                template=2;
            }
        }
        if(request.getParameter("button2")!=null){
            userName = request.getParameter("userName");
            secretQuestion = request.getParameter("secretQuestion");
            String answer = request.getParameter("answer");
            if(!DBManager.isAnswerCorrect(userName, secretQuestion, answer)){
                errorMessage = "The answer is not Correct";
                template=2;
            }else{
                password = DBManager.resetPassword(userName);
                //MailManager.sendPasswordMail(email,password);
                template = 3;
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
                <form style="width: 400px" action="forgotpassword.jsp" method="POST">
                    <fieldset>
                        <legend>Enter your username</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td><input type="text" name="userName" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" name="button1" value="Continue" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% if(!errorMessage.equals("")){%>
                    <h2 style="color: red;"><%= errorMessage%></h2>
                <% } %>
                <% } %>
                <% if(template==2) { %>
                <form style="width: 400px" action="forgotpassword.jsp" method="POST">
                    <fieldset>
                        <legend>Answer the Following Question</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>Secret Question : </td>
                                <td><textarea name="secretQuestion" readonly rows="4" cols="30"><%= secretQuestion%></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer : </td>
                                <td><input type="text" name="answer" required value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" name="button2" value="Get Password" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                            <input type="hidden" name="userName" value="<%= userName%>">
                </form> 
                <% if(!errorMessage.equals("")){%>
                    <h2 style="color: red;"><%= errorMessage%></h2>
                <% } %>
                <% } %>
                <% if(template==3) { %>
                    <h2>Your password has been successfully Updated.</h2>
                    <h3>UserName : <%=userName%></h3>
                    <h3>Password : <%=password%></h3>
                    <p>
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


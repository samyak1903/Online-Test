<%@page import="com.unisoft.model.DBManager"%>
<%@page import="com.unisoft.model.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<h3>Benefits</h3>
		<div class="bg1">
			<p>Sed tempus turpis vel quam molestie pulvinar. Suspendisse venenatis dolor semper ipsum. Quisque tempus erat ac mi. Aliquam semper, est nec hendrerit dignissim, ligula turpis sagittis purus, <a href="#">ut viverra velit eros at augue</a>. Pellentesque mi nisi, porta eget, pharetra ac, sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.</p>
		</div>
		<h3>Steps</h3>
		<div class="bg1">
			<p>Sollicitudin sit amet, nisi. In sapien ligula, sollicitudin facilisis, sodales eget, tempus in, mauris. Cras risus sem, adipiscing non, convallis ac, consectetuer eu, dolor. In quam. Curabitur tempus aliquam nulla. Etiam eros.</p>
			<ul>
				<li><a href="#"> Sed tempus turpis vel quam molestie pulvinar</a></li>
				<li><a href="#"> Suspendisse venenatis dolor semper ipsum quisque tempus</a></li>
				<li><a href="#"> Ac mi aliquam semper est nec hendrerit dignissim</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="footer">
	<p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
</div>
</body>
</html>


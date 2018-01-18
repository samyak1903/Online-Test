<%@page import="com.unisoft.model.*"%>
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
        <title>Online Testing : Test in Progress</title>
        <meta name="Keywords" content="" />
        <meta name="Description" content="" />
        <link href="../css/default.css" rel="stylesheet" type="text/css" />
        <style>
            #colTwo{
                width: 1072px;
            }
        </style>
        <script type="text/javascript">
            function loadFirstQuestion() {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    document.getElementById("question").innerHTML = xhr.responseText;
                }
                xhr.open("get", "get_question.jsp", true);
                xhr.send(null);
            }
            function loadQuestion(x) {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    document.getElementById("question").innerHTML = xhr.responseText;
                }
                var ans = 0;
                var answer = document.getElementsByName('answer');
                for (var i = 0; i < answer.length; i++) {
                    if (answer[i].checked) {
                        ans = answer[i].value;
                    }
                }
                //alert('Answer : '+ans);
                xhr.open("get", "get_question.jsp?value=" + x + "&answer=" + ans, true);
                xhr.send(null);
            }
            var time = 30;
            var exam_timer;
            function init() {
                loadFirstQuestion();
                document.getElementById("showTime").innerHTML = '<p> Time Remaining ' + time + ' Seconds</p>';
                exam_timer = setInterval("updateTime()", 1000);
            }
            function updateTime() {
                if (time > 0) {
                    time--;
                    document.getElementById("showTime").innerHTML = '<p> Time Remaining ' + time + ' Seconds</p>';
                }
                else {
                    clearTimeout(exam_timer);
                    alert('Time Over. The Exam will now Finish');
                    var ans = 0;
                    var answer = document.getElementsByName('answer');
                    for (var i = 0; i < answer.length; i++) {
                        if (answer[i].checked) {
                            ans = answer[i].value;
                        }
                    }
                    window.location.href = "get_question.jsp?value=finish&answer=" + ans;
                }
            }
        </script>        
    </head>
    <body onload="init()">
        <div id="header">
            <h1>Online Testing</h1>
        </div>
        <div id="content">
            <div id="colTwo">
                <div class="bg2">
                    <div style="border: 1px solid blue; border-radius: 20px;" id="showTime">
                    </div>
                    <div id="question">

                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href="#" rel="nofollow">Anonymous</a>.</p>
        </div>
    </body>
</html>
<% }%>


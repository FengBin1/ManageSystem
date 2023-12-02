<%--
  Created by IntelliJ IDEA.
  User: perso
  Date: 2023/12/1
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除用户</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        h1 {
            color: #333333;
        }

        input {
            margin: 10px;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            width: 200px;
            box-sizing: border-box;
            cursor: pointer;
        }

        input[type="submit"] {
            background-color: #ff4d4d;
            color: #ffffff;
        }
    </style>
</head>
<body>
<%--接收manage.jsp传递过来的id值--%>
<%
    String id = request.getParameter("id");
    //输出id值
%>
<%--将id传输到deleteServlet中--%>
<h1>现在你要删除id为<%=id%>的用户，一旦删除将无法找回！！！</h1>
<form action="delete-servlet" method="post">
    <input type="hidden" name="id" value="<%=id%>">
    <input type="submit" value="确定删除">
</form>
</body>
</html>

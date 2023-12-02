<%--
  Created by IntelliJ IDEA.
  User: perso
  Date: 2023/11/30
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
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
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        input {
            margin: 10px;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            width: 200px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #ffffff;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%--  接收传输过来的值--%>
<% String id = request.getParameter("id");%>
<% String name = request.getParameter("username");%>
<% String password = request.getParameter("password");%>
<form method="post" action="revise-servlet">
    <%--    input标签--%>
    <input type="text" name="reviseid" value="<%=id%>" readonly>
    <input type="text" name="revisename" value="<%=name%>">
    <input type="text" name="revisepassword" value="<%=password%>">
    <input type="submit" value="提交">
</form>
</body>
</html>

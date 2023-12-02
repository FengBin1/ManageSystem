<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理用户</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #dddddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        form {
            display: inline-block;
        }

        button, a {
            padding: 8px;
            margin: 4px;
            text-align: center;
            text-decoration: none;
            background-color: #008CBA;
            color: #ffffff;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        a:hover {
            background-color: #00688B;
        }
    </style>
</head>
<body>
<table>
    <thead>
    <tr>
        <th colspan="4" align="center"><a href="login.jsp">重新登录</a></th>
    </tr>
    <tr>
        <th colspan="4" align="center">用户信息</th>
    </tr>
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>密码</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${list}">
        <tr>
            <form action="revise.jsp" method="post">
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>
                    <input type="hidden" value="${user.id}" name="id">
                    <input type="hidden" value="${user.username}" name="username">
                    <input type="hidden" value="${user.password}" name="password">
                    <button type="submit">修改</button>
                    <a href="delete.jsp?id=${user.id}">删除</a>
                </td>
            </form>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

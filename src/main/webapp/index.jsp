<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        #container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        #header {
            background-color: #808080;
            padding: 10px;
            border-radius: 5px 5px 0 0;
            text-align: center;
            color: #ffffff;
        }

        #logo {
            font-size: 30px;
        }

        #nav {
            text-align: center;
            margin-top: 10px;
            padding: 10px;
        }

        #nav a {
            text-decoration: none;
            color: #000000;
            font-size: 18px;
            display: inline-block;
            margin: 10px;
            padding: 10px;
            border-radius: 5px;
            background-color: #dcdcdc;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #nav a:hover {
            background-color: #c0c0c0;
        }

        #welcome {
            text-align: center;
            color: #000000;
            margin-top: 20px;
            display: block;
        }

        #error {
            color: #ff0000;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="header">
        <span id="logo">管理系统</span>
    </div>

    <div id="nav">
        <c:if test="${empty username}">
            <a href="login.jsp">登录</a>
            <a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${not empty username}">
            <a href="manage-servlet">管理</a>
            <span id="welcome">${username}，欢迎使用管理系统</span>
        </c:if>
    </div>

    <script>
        // 接收error如果有内容就显示到页面上
        var error = "${error}";
        if (error !== "") {
            var errorMessage = document.createElement("div");
            errorMessage.id = "error";
            errorMessage.textContent = error;
            document.body.insertBefore(errorMessage, document.body.firstChild);
        }
    </script>
</div>
</body>
</html>

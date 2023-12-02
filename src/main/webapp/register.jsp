<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #ffffff;
            cursor: pointer;
        }
    </style>
</head>
<body>
<form action="register-servlet" method="post">
    <h1>注册</h1>
    用户名：<input type="text" name="username"><br>
    密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br>
    <input type="submit" value="注册">
</form>
</body>
</html>


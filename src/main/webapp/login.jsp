<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>登录</title>
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
            background-color: #008CBA;
            color: #ffffff;
            cursor: pointer;
        }

        input[type="checkbox"] {
            margin-top: 5px; /* Adjusted margin */
        }

        label {
            display: inline-flex;
            align-items: center;
        }
        #check {
            margin-left: -50px;
            width: 15px;
        }
    </style>
</head>
<body>
<!-- Your existing body content -->
<form action="login-servlet" method="post">
    <h1>登录</h1>
    用户名：<input type="text" name="username"><br>
    密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br>
    <label>
        <input type="checkbox" name="rememberMe" id="check">记住我
    </label><br>
    <input type="submit" value="登录">
</form>
</body>
<script>
    // Function to retrieve cookie value by name
    function getCookie(name) {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.startsWith(name + '=')) {
                return cookie.substring(name.length + 1);
            }
        }
        return null;
    }

    // Function to pre-fill form fields if cookies exist
    function preFillForm() {
        var usernameCookie = getCookie('username');
        var passwordCookie = getCookie('password');

        if (usernameCookie !== null && passwordCookie !== null) {
            document.getElementsByName('username')[0].value = usernameCookie;
            document.getElementsByName('password')[0].value = passwordCookie;
        }
    }

    // Call the preFillForm function when the page loads
    window.onload = preFillForm;
</script>
</html>

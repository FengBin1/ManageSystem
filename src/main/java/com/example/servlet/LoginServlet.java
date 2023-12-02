package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //强行使用dopost方法
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");//设置响应编码
        request.setCharacterEncoding("UTF-8");//设置编码
        response.setCharacterEncoding("UTF-8");//设置编码
        //前台输出out
        PrintWriter out = response.getWriter();
        // Obtain username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            //        注册驱动
            Class.forName("com.mysql.jdbc.Driver");
//        获取连接
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0615?useUnicode=true&characterEncoding=utf8", "root", "root");
//       定义sql语句
            String sql = "select password from tb_user where username='"+username+"'";
//        获取执行sql的对象
            ResultSet rs = conn.createStatement().executeQuery(sql);
//        处理结果
            if (rs.next()) {
                String pwd = rs.getString("password");
                if (pwd.equals(password)) {
                    out.print("登录成功");
                    //携带数据跳转
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);

                    // Check if the "Remember Me" checkbox is checked
                    boolean rememberMe = request.getParameter("rememberMe") != null;

// If "Remember Me" is checked, set cookies for 5 minutes
                    if (rememberMe) {
                        System.out.print("cookie");
                        Cookie usernameCookie = new Cookie("username", username);
                        Cookie passwordCookie = new Cookie("password", password);

                        // Set cookie expiration time to 5 minutes (300 seconds)
                        usernameCookie.setMaxAge(300);
                        passwordCookie.setMaxAge(300);

                        response.addCookie(usernameCookie);
                        response.addCookie(passwordCookie);
                    }


                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    out.print("密码错误");
                }
            } else {
                out.print("用户名不存在");
            }
//        释放资源
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

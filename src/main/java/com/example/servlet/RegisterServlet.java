package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "registerServlet", value = "/register-servlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");//设置响应编码
        request.setCharacterEncoding("UTF-8");//设置编码
        response.setCharacterEncoding("UTF-8");//设置编码
        //前台输出out
        PrintWriter out = response.getWriter();
        //获取前台数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            //        注册驱动
            Class.forName("com.mysql.jdbc.Driver");
//        获取连接
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0615?useUnicode=true&characterEncoding=utf8", "root", "root");
//       定义sql语句
            String sql = "insert into tb_user(username,password) values('"+username+"','"+password+"');";
            //执行添加对象
            int i = conn.createStatement().executeUpdate(sql);
//        处理结果
            if (i>0) {
                    //携带数据跳转
                    request.setAttribute("username", username);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    out.print("注册失败");
                }

//        释放资源
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

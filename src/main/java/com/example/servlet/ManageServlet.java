package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "manage-servlet", value = "/manage-servlet")
public class ManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //
        response.setContentType("text/html;charset=UTF-8");//设置响应编码
        request.setCharacterEncoding("UTF-8");//设置编码
        response.setCharacterEncoding("UTF-8");//设置编码
        //前台输出out
        PrintWriter out = response.getWriter();
        try {
            //        注册驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
//        获取连接
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0615?useUnicode=true&characterEncoding=utf8", "root", "root");
// 创建 Statement 对象
            Statement statement = conn.createStatement();
            //       定义sql语句
            String sql = "select * from tb_user;";
            //执行查看
            ResultSet resultSet = statement.executeQuery(sql);
//        利用list接收数组数据

            List<com.example.bean.login> list = new ArrayList<>();
            while (resultSet.next()) {
                com.example.bean.login user = new com.example.bean.login();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                list.add(user);
            }
            //将打包好的数据传递给前台
            request.setAttribute("list", list);
            //将数据传递给前台
            request.getRequestDispatcher("manage.jsp").forward(request, response);
            //关闭资源
            resultSet.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

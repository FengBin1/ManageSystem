package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static java.lang.System.out;

@WebServlet(name = "delete-servlet", value = "/delete-servlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //页面输出
        response.setContentType("text/html;charset=UTF-8");//设置响应编码
        request.setCharacterEncoding("UTF-8");//设置编码
        response.setCharacterEncoding("UTF-8");//设置编码
        //前台输出out
        PrintWriter out = response.getWriter();
        //获取前端id
        String id = request.getParameter("id");
        // JDBC连接相关信息
        String jdbcUrl = "jdbc:mysql://localhost:3306/test0615?useUnicode=true&characterEncoding=utf8";
        String jdbcUsername = "root";
        String jdbcPassword = "root";
        try {
            // 加载JDBC驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 建立数据库连接
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

            // 构建更新数据的SQL语句
            String updateSql = "DELETE FROM tb_user WHERE id=?";

            // 使用PreparedStatement执行SQL语句
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateSql)) {
                // 设置参数
                preparedStatement.setString(1, id);

                // 执行更新操作
                int rowsAffected = preparedStatement.executeUpdate();

                // 输出更新结果
                out.println("<p>" + rowsAffected + " 行数据已删除。</p>");
//                三秒后跳转到首页
                response.setHeader("refresh", "1;url=manage-servlet");
            }

            // 关闭数据库连接
            connection.close();
        } catch (Exception e) {
            // 处理异常
            out.println("<p>删除数据时出现错误：" + e.getMessage() + "</p>");
        }
    }
}

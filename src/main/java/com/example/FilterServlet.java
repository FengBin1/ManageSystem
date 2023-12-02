package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/*")
public class FilterServlet implements Filter {
    public void init(FilterConfig config) throws ServletException {
        System.out.println("过滤器初始化了........init... "+config);
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        // 获取请求参数或请求体数据，这里假设是参数名为 "data"
        String name = request.getParameter("username");

        // 检查数据是否包含关键字 "傻子"
        if (name != null && name.contains("傻子")) {
            // 如果包含关键字，可以选择拒绝请求，返回错误信息
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
//            将错误信息传递到index.jsp
            request.setAttribute("error","用户名不能包含敏感词汇");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            // 如果不包含关键字，继续传递请求到目标资源
            chain.doFilter(request, response);
        }
    }
}

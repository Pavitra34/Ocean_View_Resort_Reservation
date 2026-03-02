package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());

            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect("admin/dashboard.jsp");
            } 
            else if ("RECEPTIONIST".equals(user.getRole())) {
                response.sendRedirect("receptionist/dashboard.jsp");
            } 
            else if ("GUEST".equals(user.getRole())) {
                response.sendRedirect("guest/dashboard.jsp");
            }

        } else {
            response.sendRedirect("auth/login.jsp?error=true");
        }
        HttpSession session = request.getSession();

session.setAttribute("username", user.getUsername());
session.setAttribute("role", user.getRole());
session.setAttribute("userId", user.getId());   // 🔥 VERY IMPORTANT
    }
    
}
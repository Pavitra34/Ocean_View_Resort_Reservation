package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");

            UserDAO dao = new UserDAO();
            User user = dao.getUserById(id);

            user.setUsername(username);
            user.setEmail(email);
            user.setContactNumber(contact);

            boolean success = dao.updateUser(user);

            if(success){
                response.sendRedirect(request.getContextPath() + "/guest/my-profile.jsp?success=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/guest/my-profile.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/guest/my-profile.jsp?error=server");
        }
    }
}
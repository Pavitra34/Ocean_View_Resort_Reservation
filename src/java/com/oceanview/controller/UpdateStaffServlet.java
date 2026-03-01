package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

public class UpdateStaffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            UserDAO dao = new UserDAO();
            User user = dao.getUserById(id);

            if (user != null) {

                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setEmail(request.getParameter("email"));
                user.setContactNumber(request.getParameter("contact"));
                user.setAddress(request.getParameter("address"));

                dao.updateUser(user);
            }

            response.sendRedirect(request.getContextPath() + "/admin/manage-receptionists.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating staff");
        }
    }
}
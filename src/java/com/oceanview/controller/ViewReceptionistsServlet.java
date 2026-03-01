package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

public class ViewReceptionistsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserDAO dao = new UserDAO();
            List<User> receptionists = dao.getUsersByRole("RECEPTIONIST");

            request.setAttribute("receptionists", receptionists);
            request.getRequestDispatcher("admin/manage-receptionists.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading receptionists");
        }
    }
}
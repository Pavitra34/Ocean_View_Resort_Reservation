package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.oceanview.dao.UserDAO;

public class DeleteStaffServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();
        dao.deleteUser(id);

        response.sendRedirect(request.getContextPath() + "/admin/manage-receptionists.jsp");
    }
}
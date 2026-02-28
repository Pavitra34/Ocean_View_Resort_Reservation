package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.oceanview.factory.UserFactory;
import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

public class AddReceptionistServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        User receptionist = UserFactory.createUser(
                "RECEPTIONIST",
                firstname,
                lastname,
                username,
                password,
                email,
                contact,
                address
        );

        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(receptionist);

        if(success){
            response.sendRedirect("admin/add-receptionist.jsp?success=true");
        } else {
            response.getWriter().println("Error adding receptionist!");
        }
    }
}
package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;

@WebServlet("/StatusUpdateServlet")
public class StatusUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("role") == null){
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        // Only ADMIN or RECEPTIONIST allowed
        if(!role.equals("ADMIN") && !role.equals("RECEPTIONIST")){
            response.sendRedirect("auth/login.jsp");
            return;
        }

        try{

            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");

            ReservationDAO dao = new ReservationDAO();
            dao.updateStatus(id, status);

            // Redirect based on role
            if(role.equals("ADMIN")){
                response.sendRedirect("admin/reservation-list.jsp");
            } else {
                response.sendRedirect("receptionist/reservation-list.jsp");
            }

        }catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;

@WebServlet("/CompleteBookingServlet")
public class CompleteBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            ReservationDAO dao = new ReservationDAO();

            // Complete booking → Confirm
            dao.updateStatus(id, "CONFIRMED");

            response.sendRedirect(request.getContextPath()
                    + "/admin/reservation-list.jsp?completed=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/admin/reservation-list.jsp?error=true");
        }
    }
}
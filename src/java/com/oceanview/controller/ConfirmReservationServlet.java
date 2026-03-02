package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;

@WebServlet("/ConfirmReservationServlet")
public class ConfirmReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ReservationDAO dao = new ReservationDAO();
        dao.updateReservationStatus(id, "CONFIRMED");

        response.sendRedirect(request.getContextPath() + "/admin/reservation-list.jsp");
    }
}
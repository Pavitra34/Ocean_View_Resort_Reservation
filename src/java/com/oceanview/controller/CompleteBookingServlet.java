package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.singleton.DatabaseConnection;

@WebServlet("/CompleteBookingServlet")
public class CompleteBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ReservationDAO dao = new ReservationDAO();
        dao.updateReservationStatus(id, "CONFIRMED");

        response.sendRedirect(request.getContextPath()
                + "/admin/reservation-list.jsp");
    }
}
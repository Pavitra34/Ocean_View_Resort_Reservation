package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            // 🔐 Get logged-in user id from session
            Integer userId = (Integer) request.getSession().getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("auth/login.jsp");
                return;
            }

            ReservationDAO dao = new ReservationDAO();

            // 🔐 Verify reservation belongs to logged user
            Reservation r = dao.getReservationById(id);

            if (r != null && r.getUserId() == userId) {

                dao.updateReservationStatus(id, "CANCELLED");

                response.sendRedirect("guest/my-reservations.jsp?cancelled=true");

            } else {

                response.sendRedirect("guest/my-reservations.jsp?error=unauthorized");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("guest/my-reservations.jsp?error=true");
        }
    }
}
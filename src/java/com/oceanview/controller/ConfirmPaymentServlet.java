package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.oceanview.dao.ReservationDAO;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            ReservationDAO dao = new ReservationDAO();

            // After payment, mark confirmed
            dao.updateStatus(id, "CONFIRMED");

            response.sendRedirect(request.getContextPath()
                    + "/admin/reservation-list.jsp?paymentSuccess=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/admin/reservation-list.jsp?error=true");
        }
    }
}
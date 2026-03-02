package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import com.oceanview.builder.ReservationBuilder;
import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String guestName = request.getParameter("guestName");
            String address = request.getParameter("address");
            String contact = request.getParameter("contactNumber");
            String roomType = request.getParameter("roomType");

            LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));

            if (contact == null || contact.trim().isEmpty()) {
                response.sendRedirect("admin/add-reservation.jsp?error=contact");
                return;
            }

            long days = ChronoUnit.DAYS.between(checkIn, checkOut);
            double total = days * 5000;

            String reservationNumber =
                    "RES-" + UUID.randomUUID().toString().substring(0, 8);

            Reservation reservation = new ReservationBuilder()
                    .setReservationNumber(reservationNumber)
                    .setGuestName(guestName)
                    .setAddress(address)
                    .setContactNumber(contact)
                    .setRoomType(roomType)
                    .setCheckIn(checkIn)
                    .setCheckOut(checkOut)
                    .setTotalAmount(total)
                    .setStatus("PENDING")
                    .build();

            ReservationDAO dao = new ReservationDAO();
            boolean success = dao.addReservation(reservation);

            if (success) {
                response.sendRedirect("admin/add-reservation.jsp?success=true");
            } else {
                response.sendRedirect("admin/add-reservation.jsp?error=dberror");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/add-reservation.jsp?error=servererror");
        }
    }
}
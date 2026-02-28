package com.oceanview.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import com.oceanview.builder.ReservationBuilder;
import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

public class AddReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String guestName = request.getParameter("guestName");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String roomType = request.getParameter("roomType");

            LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));

            LocalDate today = LocalDate.now();

            /* ===============================
               DATE VALIDATION
            =============================== */

            // ❌ Past date not allowed
            if (checkIn.isBefore(today)) {
                response.sendRedirect("admin/add-reservation.jsp?error=pastdate");
                return;
            }

            // ❌ Checkout must be after checkin
            if (!checkOut.isAfter(checkIn)) {
                response.sendRedirect("admin/add-reservation.jsp?error=invalidrange");
                return;
            }

            long days = ChronoUnit.DAYS.between(checkIn, checkOut);

            // ❌ Minimum stay validation
            if (days <= 0) {
                response.sendRedirect("admin/add-reservation.jsp?error=invaliddays");
                return;
            }

            /* ===============================
               PRICE CALCULATION
            =============================== */

            double rate = 5000; // later connect to Room table
            double total = days * rate;

            String reservationNumber =
                    "RES-" + UUID.randomUUID().toString().substring(0, 8);

            /* ===============================
               BUILD OBJECT (Builder Pattern)
            =============================== */

            Reservation reservation = new ReservationBuilder()
                    .setReservationNumber(reservationNumber)
                    .setGuestName(guestName)
                    .setAddress(address)
                    .setContactNumber(contact)
                    .setRoomType(roomType)
                    .setCheckIn(checkIn)
                    .setCheckOut(checkOut)
                    .setTotalAmount(total)
                    .build();

            /* ===============================
               SAVE TO DATABASE
            =============================== */

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
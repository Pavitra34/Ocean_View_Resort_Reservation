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

@WebServlet("/GuestReservationServlet")
public class GuestReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String guestName = request.getParameter("guestName");
            String address = request.getParameter("address");   // ✅ ADDED
            String contact = request.getParameter("contactNumber");
            String roomType = request.getParameter("roomType");

            LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));

            long days = ChronoUnit.DAYS.between(checkIn, checkOut);

            if(days <= 0){
                response.sendRedirect("guest/book-room.jsp?error=invaliddates");
                return;
            }

            double total = days * 5000;

            String reservationNumber =
                    "RES-" + UUID.randomUUID().toString().substring(0, 8);

int userId = (int) request.getSession().getAttribute("userId");

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
        .setUserId(userId)   // 🔥 ADD THIS
        .build();

            ReservationDAO dao = new ReservationDAO();
            boolean success = dao.addReservation(reservation);

            if(success){
                response.sendRedirect("guest/dashboard.jsp?success=true");
            } else {
                response.sendRedirect("guest/book-room.jsp?error=dberror");
            }

        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("guest/book-room.jsp?error=server");
        }
    }
}
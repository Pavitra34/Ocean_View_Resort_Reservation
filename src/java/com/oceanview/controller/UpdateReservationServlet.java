package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.oceanview.singleton.DatabaseConnection;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String roomType = request.getParameter("roomType");

            LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));

            long days = ChronoUnit.DAYS.between(checkIn, checkOut);
            double total = days * 5000;

            String sql = "UPDATE reservations "
                    + "SET room_type=?, check_in=?, check_out=?, total_amount=? "
                    + "WHERE id=?";

            try (Connection con = new DatabaseConnection().getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, roomType);
                ps.setDate(2, Date.valueOf(checkIn));
                ps.setDate(3, Date.valueOf(checkOut));
                ps.setDouble(4, total);
                ps.setInt(5, id);

                ps.executeUpdate();
            }

            response.sendRedirect("guest/my-reservations.jsp?updated=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("guest/my-reservations.jsp?error=true");
        }
    }
}
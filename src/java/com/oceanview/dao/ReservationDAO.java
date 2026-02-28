package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.oceanview.singleton.DatabaseConnection;
import com.oceanview.model.Reservation;
import java.sql.Date; 
public class ReservationDAO {

    /* ===============================
       ADD RESERVATION
    =============================== */
    public boolean addReservation(Reservation reservation) {

        String sql = "INSERT INTO reservations "
                + "(reservation_number, guest_name, address, contact_number, "
                + "room_type, check_in, check_out, total_amount) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, reservation.getReservationNumber());
            ps.setString(2, reservation.getGuestName());
            ps.setString(3, reservation.getAddress());
            ps.setString(4, reservation.getContactNumber());
            ps.setString(5, reservation.getRoomType());
            ps.setDate(6, java.sql.Date.valueOf(reservation.getCheckIn()));
            ps.setDate(7, java.sql.Date.valueOf(reservation.getCheckOut()));
            ps.setDouble(8, reservation.getTotalAmount());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /* ===============================
       GET ALL RESERVATIONS
    =============================== */
    public List<Reservation> getAllReservations() {

        List<Reservation> list = new ArrayList<>();

        String sql = "SELECT * FROM reservations ORDER BY id DESC";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Reservation reservation = new Reservation(
                        rs.getString("reservation_number"),
                        rs.getString("guest_name"),
                        rs.getString("address"),
                        rs.getString("contact_number"),
                        rs.getString("room_type"),
                        rs.getDate("check_in") != null ? 
                            rs.getDate("check_in").toLocalDate() : null,
                        rs.getDate("check_out") != null ? 
                            rs.getDate("check_out").toLocalDate() : null,
                        rs.getDouble("total_amount")
                );

                list.add(reservation);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /* ===============================
       DELETE RESERVATION (Optional)
    =============================== */
    public boolean deleteReservation(String reservationNumber) {

        String sql = "DELETE FROM reservations WHERE reservation_number = ?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, reservationNumber);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
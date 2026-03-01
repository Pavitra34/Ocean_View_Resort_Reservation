package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.oceanview.singleton.DatabaseConnection;
import com.oceanview.model.Reservation;

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
            ps.setDate(6, Date.valueOf(reservation.getCheckIn()));
            ps.setDate(7, Date.valueOf(reservation.getCheckOut()));
            ps.setDouble(8, reservation.getTotalAmount());

            return ps.executeUpdate() > 0;

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

                Reservation r = new Reservation(
                        rs.getString("reservation_number"),
                        rs.getString("guest_name"),
                        rs.getString("address"),
                        rs.getString("contact_number"),
                        rs.getString("room_type"),
                        rs.getDate("check_in").toLocalDate(),
                        rs.getDate("check_out").toLocalDate(),
                        rs.getDouble("total_amount")
                );

                r.setId(rs.getInt("id"));   // 🔥 NOW WORKS
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /* ===============================
       GET RESERVATION BY ID
    =============================== */
    public Reservation getReservationById(int id) {

        Reservation reservation = null;
        String sql = "SELECT * FROM reservations WHERE id = ?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                reservation = new Reservation(
                        rs.getString("reservation_number"),
                        rs.getString("guest_name"),
                        rs.getString("address"),
                        rs.getString("contact_number"),
                        rs.getString("room_type"),
                        rs.getDate("check_in").toLocalDate(),
                        rs.getDate("check_out").toLocalDate(),
                        rs.getDouble("total_amount")
                );

                reservation.setId(rs.getInt("id")); // 🔥 NOW SAFE
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservation;
    }
    
    public double getTotalRevenue() {

    double total = 0;

    String sql = "SELECT SUM(total_amount) AS revenue FROM reservations";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            total = rs.getDouble("revenue");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return total;
}
    public List<Reservation> searchReservations(String keyword) {

    List<Reservation> list = new ArrayList<>();

    String sql = "SELECT * FROM reservations " +
                 "WHERE reservation_number LIKE ? " +
                 "OR guest_name LIKE ? " +
                 "ORDER BY id DESC";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Reservation r = new Reservation(
                rs.getString("reservation_number"),
                rs.getString("guest_name"),
                rs.getString("address"),
                rs.getString("contact_number"),
                rs.getString("room_type"),
                rs.getDate("check_in").toLocalDate(),
                rs.getDate("check_out").toLocalDate(),
                rs.getDouble("total_amount")
            );

            r.setId(rs.getInt("id"));  // Important
            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    
    /* ===============================
   TOTAL RESERVATIONS
================================= */
public int getTotalReservations() {

    int total = 0;
    String sql = "SELECT COUNT(*) FROM reservations";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            total = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return total;
}


/* ===============================
   TOTAL GUESTS (Assuming 1 guest per reservation)
================================= */
public int getTotalGuests() {

    int total = 0;
    String sql = "SELECT COUNT(DISTINCT guest_name) FROM reservations";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            total = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return total;
}
}
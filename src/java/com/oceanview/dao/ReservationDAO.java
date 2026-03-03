package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.oceanview.singleton.DatabaseConnection;
import com.oceanview.model.Reservation;

public class ReservationDAO {

    /* ADD RESERVATION */
    public boolean addReservation(Reservation reservation) {

        String sql = "INSERT INTO reservations "
                + "(reservation_number, guest_name, address, contact_number, "
                + "room_type, check_in, check_out, total_amount, status, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            ps.setString(9, reservation.getStatus());
            ps.setInt(10, reservation.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /* UPDATE STATUS */
public boolean updateStatus(int id, String status) {

    String sql = "UPDATE reservations SET status=? WHERE id=?";

    try(Connection con = new DatabaseConnection().getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, status);
        ps.setInt(2, id);

        return ps.executeUpdate() > 0;

    } catch(Exception e){
        e.printStackTrace();
    }

    return false;
}

    /* GET CONFIRMED BY USER */
    public List<Reservation> getConfirmedReservationsByUser(int userId) {

        List<Reservation> list = new ArrayList<>();

        String sql = "SELECT * FROM reservations "
                   + "WHERE user_id=? AND status='CONFIRMED' "
                   + "ORDER BY id DESC";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
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
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getInt("user_id")
                );

                r.setId(rs.getInt("id"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    /* ================= GET RESERVATION BY ID ================= */
public Reservation getReservationById(int id) {

    Reservation reservation = null;

    String sql = "SELECT * FROM reservations WHERE id=?";

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
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getInt("user_id")   // 🔥 important
            );

            reservation.setId(rs.getInt("id"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return reservation;
}
public int getTotalReservations() {

    int count = 0;
    String sql = "SELECT COUNT(*) FROM reservations";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            count = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return count;
}
public double getTotalRevenue() {

    double revenue = 0;

    String sql = "SELECT SUM(total_amount) FROM reservations " +
                 "WHERE status IN ('CONFIRMED','CHECKED_OUT')";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            revenue = rs.getDouble(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return revenue;
}
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
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getInt("user_id")
            );

            r.setId(rs.getInt("id"));
            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
public List<Reservation> searchReservations(String keyword) {

    List<Reservation> list = new ArrayList<>();

    String sql = "SELECT * FROM reservations "
               + "WHERE reservation_number LIKE ? "
               + "OR guest_name LIKE ? "
               + "ORDER BY id DESC";

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
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getInt("user_id")
            );

            r.setId(rs.getInt("id"));
            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
/* ================= GET RESERVATIONS BY USER ================= */
public List<Reservation> getReservationsByUser(int userId) {

    List<Reservation> list = new ArrayList<>();

    String sql = "SELECT * FROM reservations "
               + "WHERE user_id=? "
               + "ORDER BY id DESC";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);
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
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getInt("user_id")
            );

            r.setId(rs.getInt("id"));
            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
public int getTodayCheckIns() {

    String sql = "SELECT COUNT(*) FROM reservations " +
                 "WHERE status='CHECKED_IN'";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) return rs.getInt(1);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
}
public int getTodayCheckOuts() {

    String sql = "SELECT COUNT(*) FROM reservations " +
                 "WHERE status='CHECKED_OUT'";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) return rs.getInt(1);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
}
public int getTodayConfirmed() {

    String sql = "SELECT COUNT(*) FROM reservations " +
                 "WHERE status='CONFIRMED' " +
                 "AND DATE(created_at)=CURDATE()";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) return rs.getInt(1);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
}
public double getTodayRevenue() {

    String sql = "SELECT SUM(total_amount) FROM reservations " +
                 "WHERE status IN ('CHECKED_IN','CHECKED_OUT')";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) return rs.getDouble(1);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
}
}
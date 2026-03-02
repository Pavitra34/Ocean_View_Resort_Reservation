package com.oceanview.dao;

import java.sql.*;
import com.oceanview.singleton.DatabaseConnection;

public class BookingDAO {

    public boolean createBooking(int reservationId,
                                 double amount,
                                 String paymentMethod){

        String sql = "INSERT INTO bookings "
                   + "(reservation_id, payment_amount, payment_method, payment_status) "
                   + "VALUES (?, ?, ?, ?)";

        try(Connection con = new DatabaseConnection().getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){

            ps.setInt(1, reservationId);
            ps.setDouble(2, amount);
            ps.setString(3, paymentMethod);
            ps.setString(4, "PAID");

            return ps.executeUpdate() > 0;

        } catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
}
package com.oceanview.dao;

import java.sql.*;
import com.oceanview.model.Room;
import com.oceanview.singleton.DatabaseConnection;

public class RoomDAO {

public boolean addRoom(Room room) {

    String sql = "INSERT INTO rooms (room_number, room_type, price_per_night, status) VALUES (?, ?, ?, ?)";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, room.getRoomNumber());
        ps.setString(2, room.getRoomType());
        ps.setDouble(3, room.getPricePerNight());
        ps.setString(4, room.getStatus());

        int rows = ps.executeUpdate();
        return rows > 0;

    } catch(Exception e){
        e.printStackTrace();
        System.out.println("ROOM INSERT ERROR: " + e.getMessage());
    }

    return false;
}
}
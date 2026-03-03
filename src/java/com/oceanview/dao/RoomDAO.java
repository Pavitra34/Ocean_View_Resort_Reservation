package com.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.oceanview.model.Room;
import com.oceanview.singleton.DatabaseConnection;

public class RoomDAO {

    // Add Room
    public boolean addRoom(Room room) {

        String sql = "INSERT INTO rooms (room_number, room_type, price_per_night, status) VALUES (?, ?, ?, ?)";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setDouble(3, room.getPricePerNight());
            ps.setString(4, room.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get All Rooms
    public List<Room> getAllRooms() {

        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM rooms ORDER BY id DESC";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Room room = new Room(
                        rs.getString("room_number"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("status")
                );

                room.setId(rs.getInt("id"));
                list.add(room);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Room By ID
    public Room getRoomById(int id) {

        String sql = "SELECT * FROM rooms WHERE id=?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Room room = new Room(
                        rs.getString("room_number"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("status")
                );

                room.setId(rs.getInt("id"));
                return room;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update Room
public boolean updateRoom(Room room) {

    String sql = "UPDATE rooms SET room_number=?, room_type=?, price_per_night=?, status=? WHERE id=?";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, room.getRoomNumber());
        ps.setString(2, room.getRoomType());
        ps.setDouble(3, room.getPricePerNight());
        ps.setString(4, room.getStatus());
        ps.setInt(5, room.getId());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}

    // Delete Room
    public boolean deleteRoom(int id) {

        String sql = "DELETE FROM rooms WHERE id=?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    /* ===============================
   AVAILABLE ROOMS COUNT
================================= */
public int getAvailableRoomsCount() {

    int total = 0;
    String sql = "SELECT COUNT(*) FROM rooms WHERE status = 'AVAILABLE'";

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
public boolean updateRoomStatus(int id, String status) {

    String sql = "UPDATE rooms SET status=? WHERE id=?";

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
    
}
package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.oceanview.singleton.DatabaseConnection;
import com.oceanview.model.User;
import com.oceanview.factory.UserFactory;

public class UserDAO {

    /* =========================================
       REGISTER USER
    ========================================= */
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users " +
                "(firstname, lastname, username, password, email, role, contact_number, address) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getRole());
            ps.setString(7, user.getContactNumber());
            ps.setString(8, user.getAddress());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    // DELETE STAFF
public boolean deleteUser(int id) {

    String sql = "DELETE FROM users WHERE id=?";

    try(Connection con = new DatabaseConnection().getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        return ps.executeUpdate() > 0;

    } catch(Exception e){
        e.printStackTrace();
    }

    return false;
}

// GET USER BY ID (FOR EDIT)
public User getUserById(int id){

    String sql = "SELECT * FROM users WHERE id=?";

    try(Connection con = new DatabaseConnection().getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            User user = UserFactory.createUser(
                    rs.getString("role"),
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("contact_number"),
                    rs.getString("address")
            );

            user.setId(rs.getInt("id"));
            return user;
        }

    } catch(Exception e){
        e.printStackTrace();
    }

    return null;
}

// UPDATE USER
public boolean updateUser(User user){

    String sql = "UPDATE users SET firstname=?, lastname=?, email=?, contact_number=?, address=? WHERE id=?";

    try(Connection con = new DatabaseConnection().getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, user.getFirstname());
        ps.setString(2, user.getLastname());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getContactNumber());
        ps.setString(5, user.getAddress());
        ps.setInt(6, user.getId());

        return ps.executeUpdate() > 0;

    } catch(Exception e){
        e.printStackTrace();
    }

    return false;
}

    /* =========================================
       GET USERS BY ROLE (FIXED VERSION)
    ========================================= */
    public List<User> getUsersByRole(String role) {

        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM users WHERE role = ?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = UserFactory.createUser(
                        rs.getString("role"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("contact_number"),
                        rs.getString("address")
                );

                user.setId(rs.getInt("id"));
                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /* =========================================
       LOGIN
    ========================================= */
    public User login(String username, String password) {

        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        try (Connection con = new DatabaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rsToUser(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /* =========================================
       RESULTSET TO USER
    ========================================= */
    private User rsToUser(ResultSet rs) throws SQLException {

        User user = UserFactory.createUser(
                rs.getString("role"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("contact_number"),
                rs.getString("address")
        );

        user.setId(rs.getInt("id"));
        return user;
    }
    public int getTotalGuests() {

    int count = 0;

    String sql = "SELECT COUNT(*) FROM users WHERE role = 'GUEST'";

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
}
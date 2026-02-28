package com.oceanview.dao;

import java.sql.*;
import com.oceanview.singleton.DatabaseConnection;
import com.oceanview.model.User;
import com.oceanview.factory.UserFactory;

public class UserDAO {

public boolean registerUser(User user) {

    String sql = "INSERT INTO users (firstname, lastname, username, password, email, role, contact_number, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try (Connection con = new DatabaseConnection().getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, user.getFirstname());
        ps.setString(2, user.getLastname());
        ps.setString(3, user.getUsername());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getEmail());
        ps.setString(6, user.getRole());   // VERY IMPORTANT
        ps.setString(7, user.getContactNumber());
        ps.setString(8, user.getAddress());

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("USER INSERT ERROR: " + e.getMessage());
    }

    return false;
}

public User login(String username, String password) {

    String sql = "SELECT * FROM users WHERE username=? AND password=?";

    try {
        Connection con = new DatabaseConnection().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

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

    private User rsToUser(ResultSet rs) throws SQLException {

        return UserFactory.createUser(
                rs.getString("role"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("contact_number"),
                rs.getString("address")
        );
    }
}
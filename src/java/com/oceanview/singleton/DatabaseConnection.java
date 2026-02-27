package com.oceanview.singleton;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private static DatabaseConnection instance;
    private Connection connection;

    private final String URL = "jdbc:mysql://localhost:3306/ocean_view_resort?useSSL=false&serverTimezone=UTC";
    private final String USER = "root";
    private final String PASSWORD = "";

    private DatabaseConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");  // 🔥 MUST ADD

        connection = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("Database Connected Successfully!");
    }

    public static DatabaseConnection getInstance() throws Exception {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }
}
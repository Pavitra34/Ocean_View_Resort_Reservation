package com.oceanview.factory;

import com.oceanview.model.*;

public class UserFactory {

    public static User createUser(String role,
                                  String firstname,
                                  String lastname,
                                  String username,
                                  String password,
                                  String email,
                                  String contact,
                                  String address) {

        switch(role.toUpperCase()) {

            case "ADMIN":
                return new Admin(firstname, lastname, username, password, email, contact, address);

            case "RECEPTIONIST":
                return new Receptionist(firstname, lastname, username, password, email, contact, address);

            case "GUEST":
                return new Guest(firstname, lastname, username, password, email, contact, address);

            default:
                return null;
        }
    }
}
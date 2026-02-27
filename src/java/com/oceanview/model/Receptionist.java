package com.oceanview.model;

public class Receptionist extends User {

    public Receptionist(String firstname, String lastname,
                        String username, String password,
                        String email, String contactNumber,
                        String address) {

        super(firstname, lastname, username, password,
              email, "RECEPTIONIST", contactNumber, address);
    }
}
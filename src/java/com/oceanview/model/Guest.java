package com.oceanview.model;

public class Guest extends User {

    public Guest(String firstname, String lastname,
                 String username, String password,
                 String email, String contactNumber,
                 String address) {

        super(firstname, lastname, username, password,
              email, "GUEST", contactNumber, address);
    }
}
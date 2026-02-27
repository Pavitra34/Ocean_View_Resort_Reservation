package com.oceanview.model;

public class Admin extends User {

    public Admin(String firstname, String lastname,
                 String username, String password,
                 String email, String contactNumber,
                 String address) {

        super(firstname, lastname, username, password,
              email, "ADMIN", contactNumber, address);
    }
}
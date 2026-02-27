package com.oceanview.model;

public abstract class User {

    protected String firstname;
    protected String lastname;
    protected String username;
    protected String password;
    protected String email;
    protected String role;
    protected String contactNumber;
    protected String address;

    public User(String firstname, String lastname, String username,
                String password, String email, String role,
                String contactNumber, String address) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
        this.contactNumber = contactNumber;
        this.address = address;
    }

    // 🔹 Add GETTERS (IMPORTANT)

    public String getFirstname() { return firstname; }
    public String getLastname() { return lastname; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getEmail() { return email; }
    public String getRole() { return role; }
    public String getContactNumber() { return contactNumber; }
    public String getAddress() { return address; }
}
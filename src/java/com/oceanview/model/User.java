package com.oceanview.model;


public abstract class User {

    protected int id;
    protected String firstname;
    protected String lastname;
    protected String username;
    protected String password;
    protected String email;
    protected String role;
    protected String contactNumber;
    protected String address;

    // Constructor
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

    // ======================
    // GETTERS & SETTERS
    // ======================

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFirstname() { return firstname; }
    public void setFirstname(String firstname) { this.firstname = firstname; }

    public String getLastname() { return lastname; }
    public void setLastname(String lastname) { this.lastname = lastname; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getAddress() { return address; }
    public void setAddress(String address) {
        this.address = address;
    }
}
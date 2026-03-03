package com.oceanview.model;

import java.time.LocalDate;

public class Reservation {

    private int id;
    private String reservationNumber;
    private String guestName;
    private String address;
    private String contactNumber;
    private String roomType;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private double totalAmount;
    private String status;
    private int userId;   // 🔥 IMPORTANT

    public Reservation(String reservationNumber,
                       String guestName,
                       String address,
                       String contactNumber,
                       String roomType,
                       LocalDate checkIn,
                       LocalDate checkOut,
                       double totalAmount,
                       String status,
                       int userId) {

        this.reservationNumber = reservationNumber;
        this.guestName = guestName;
        this.address = address;
        this.contactNumber = contactNumber;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalAmount = totalAmount;
        this.status = status;
        this.userId = userId;
    }

    // GETTERS
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getReservationNumber() { return reservationNumber; }
    public String getGuestName() { return guestName; }
    public String getAddress() { return address; }
    public String getContactNumber() { return contactNumber; }
    public String getRoomType() { return roomType; }
    public LocalDate getCheckIn() { return checkIn; }
    public LocalDate getCheckOut() { return checkOut; }
    public double getTotalAmount() { return totalAmount; }
    public String getStatus() { return status; }
    public int getUserId() { return userId; }

    public void setStatus(String status) { this.status = status; }
}
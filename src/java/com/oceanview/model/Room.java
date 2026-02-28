package com.oceanview.model;

public class Room {

    private String roomNumber;
    private String roomType;
    private double pricePerNight;
    private String status;

    public Room(String roomNumber, String roomType,
                double pricePerNight, String status) {

        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.status = status;
    }

    public String getRoomNumber() { return roomNumber; }
    public String getRoomType() { return roomType; }
    public double getPricePerNight() { return pricePerNight; }
    public String getStatus() { return status; }
}
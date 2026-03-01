package com.oceanview.model;

public class Room {

    private int id;   // ADD THIS
    private String roomNumber;
    private String roomType;
    private double pricePerNight;
    private String status;

    public Room() {}   // Empty constructor

    public Room(String roomNumber, String roomType,
                double pricePerNight, String status) {

        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public double getPricePerNight() { return pricePerNight; }
    public void setPricePerNight(double pricePerNight) { this.pricePerNight = pricePerNight; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
package com.oceanview.builder;

import com.oceanview.model.Reservation;
import java.time.LocalDate;

public class ReservationBuilder {

    private String reservationNumber;
    private String guestName;
    private String address;
    private String contactNumber;
    private String roomType;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private double totalAmount;

    public ReservationBuilder setReservationNumber(String reservationNumber) {
        this.reservationNumber = reservationNumber;
        return this;
    }

    public ReservationBuilder setGuestName(String guestName) {
        this.guestName = guestName;
        return this;
    }

    public ReservationBuilder setAddress(String address) {
        this.address = address;
        return this;
    }

    public ReservationBuilder setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
        return this;
    }

    public ReservationBuilder setRoomType(String roomType) {
        this.roomType = roomType;
        return this;
    }

    public ReservationBuilder setCheckIn(LocalDate checkIn) {
        this.checkIn = checkIn;
        return this;
    }

    public ReservationBuilder setCheckOut(LocalDate checkOut) {
        this.checkOut = checkOut;
        return this;
    }

    public ReservationBuilder setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
        return this;
    }

    public Reservation build() {
        return new Reservation(reservationNumber, guestName,
                address, contactNumber, roomType,
                checkIn, checkOut, totalAmount);
    }
}
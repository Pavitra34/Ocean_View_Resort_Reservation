package com.oceanview.decorator;

import com.oceanview.invoice.Invoice;
import com.oceanview.model.Reservation;

public class BasicInvoice implements Invoice {

    @Override
    public String generate(Reservation r){

        return "<h3>Reservation Details</h3>" +
               "<p><strong>Reservation No:</strong> " + r.getReservationNumber() + "</p>" +
               "<p><strong>Guest:</strong> " + r.getGuestName() + "</p>" +
               "<p><strong>Room:</strong> " + r.getRoomType() + "</p>" +
               "<p><strong>Check-In:</strong> " + r.getCheckIn() + "</p>" +
               "<p><strong>Check-Out:</strong> " + r.getCheckOut() + "</p>" +
               "<p><strong>Room Charge:</strong> LKR " + r.getTotalAmount() + "</p>";
    }
}
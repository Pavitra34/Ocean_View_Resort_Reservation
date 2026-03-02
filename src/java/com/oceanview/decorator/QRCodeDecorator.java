package com.oceanview.decorator;

import com.oceanview.invoice.Invoice;
import com.oceanview.model.Reservation;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class QRCodeDecorator extends InvoiceDecorator {

    public QRCodeDecorator(Invoice invoice){
        super(invoice);
    }

    @Override
    public String generate(Reservation r){

        double tax = r.getTotalAmount() * 0.10;
        double service = r.getTotalAmount() * 0.05;

        // 🔥 Full QR content
        String qrData =
                "Reservation No: " + r.getReservationNumber() + "\n" +
                "Guest: " + r.getGuestName() + "\n" +
                "Room: " + r.getRoomType() + "\n" +
                "Check-In: " + r.getCheckIn() + "\n" +
                "Check-Out: " + r.getCheckOut() + "\n" +
                "Room Charge: LKR " + r.getTotalAmount() + "\n" +
                "Tax (10%): LKR " + tax + "\n" +
                "Service Charge (5%): LKR " + service;

        // URL encode (VERY IMPORTANT)
        String encodedData = URLEncoder.encode(qrData, StandardCharsets.UTF_8);

        return super.generate(r) +
               "<br><br><h4>Scan for Bill Details</h4>" +
               "<img src='https://api.qrserver.com/v1/create-qr-code/?size=180x180&data="
               + encodedData + "' />";
    }
}
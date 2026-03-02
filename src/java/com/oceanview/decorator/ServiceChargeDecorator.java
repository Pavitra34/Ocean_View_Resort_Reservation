package com.oceanview.decorator;

import com.oceanview.invoice.Invoice;
import com.oceanview.model.Reservation;

public class ServiceChargeDecorator extends InvoiceDecorator {

    public ServiceChargeDecorator(Invoice invoice){
        super(invoice);
    }

    @Override
    public String generate(Reservation r){

        double service = r.getTotalAmount() * 0.05; // 5% service

        return super.generate(r) +
               "<p><strong>Service Charge (5%):</strong> LKR " + service + "</p>";
    }
}
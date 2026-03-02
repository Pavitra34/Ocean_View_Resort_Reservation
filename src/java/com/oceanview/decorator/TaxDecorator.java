package com.oceanview.decorator;

import com.oceanview.invoice.Invoice;
import com.oceanview.model.Reservation;

public class TaxDecorator extends InvoiceDecorator {

    public TaxDecorator(Invoice invoice){
        super(invoice);
    }

    @Override
    public String generate(Reservation r){

        double tax = r.getTotalAmount() * 0.10; // 10% tax

        return super.generate(r) +
               "<p><strong>Tax (10%):</strong> LKR " + tax + "</p>";
    }
}
package com.oceanview.decorator;

import com.oceanview.invoice.Invoice;
import com.oceanview.model.Reservation;

public abstract class InvoiceDecorator implements Invoice {

    protected Invoice invoice;

    public InvoiceDecorator(Invoice invoice){
        this.invoice = invoice;
    }

    @Override
    public String generate(Reservation reservation){
        return invoice.generate(reservation);
    }
}
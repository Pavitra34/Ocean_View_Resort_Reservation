package com.oceanview.invoice;

import com.oceanview.model.Reservation;

public interface Invoice {
    String generate(Reservation reservation);
}
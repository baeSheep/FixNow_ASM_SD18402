package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "BookingDetails")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bookingDetailID;

    @ManyToOne
    @JoinColumn(name = "bookingID", nullable = false)
    private Booking booking;

    @ManyToOne
    @JoinColumn(name = "serviceID", nullable = false)
    private Services service;

    private Integer quantity;

    private Double price;

    private Double discount;

    @Transient  // Exclude from persistent fields as this will be calculated
    private Double totalPrice;

    // You can create a getter to calculate the total price
    public Double getTotalPrice() {
        return quantity * (price - (discount != null ? discount : 0));
    }
}

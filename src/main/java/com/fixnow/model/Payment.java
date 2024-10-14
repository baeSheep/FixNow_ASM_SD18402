package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "Payments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

    @Id
    private String paymentID;

    @ManyToOne
    @JoinColumn(name = "BookingID", nullable = false)
    private Booking booking;

    private Date paymentDate;
    private String paymentMethod;

    // Khóa ngoại đến bảng User
    @ManyToOne
    @JoinColumn(name = "UserID", nullable = false)
    private User user; // Tham chiếu đến bảng User

    // Các trường thông tin khác
    @Column(name = "CustomerName", nullable = false)
    private String customerName;

    @Column(name = "CustomerAddress", nullable = false)
    private String customerAddress;

    @Column(name = "DetailedAddress")
    private String detailedAddress;

    @Column(name = "PhoneNumber", nullable = false)
    private String phoneNumber;

    @Column(name = "Amount", nullable = false)
    private double amount; // Số tiền thanh toán
}

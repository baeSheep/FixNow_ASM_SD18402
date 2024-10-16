package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

<<<<<<< HEAD
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
=======
import java.util.Date;
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3

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
<<<<<<< HEAD
    public void generatePaymentID() {
        // Lấy ngày hiện tại theo định dạng ddMMyyyy
        String datePart = new SimpleDateFormat("ddMMyy").format(new Date());

        // Tạo số ngẫu nhiên 3 chữ số
        int randomNumber = new Random().nextInt(1000); // Từ 0 đến 999
        String randomNumberStr = String.format("%03d", randomNumber); // Đảm bảo có 3 chữ số

        // Ghép lại thành paymentID
        this.paymentID = "PAY" + datePart + randomNumberStr;
    }

=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
}

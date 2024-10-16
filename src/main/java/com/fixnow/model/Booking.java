package com.fixnow.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {

    @Id
    private String bookingID;

    @ManyToOne
    @JoinColumn(name = "UserID", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "ServiceID", nullable = false)
    private Services service;

    @ManyToOne
    @JoinColumn(name = "ProviderID", nullable = false)
    private User provider;

    private Date bookingDate;
    private String status;
    private String paymentStatus;
    private String notes;

    // Hàm tạo ID booking
    public void generateBookingID() {
<<<<<<< HEAD
        // Lấy ngày hiện tại theo định dạng ddMMyyyy
        String datePart = new SimpleDateFormat("ddMMyy").format(new Date());

=======
        // Lấy ngày hiện tại
        String datePart = new SimpleDateFormat("ddMMyy").format(new Date());

        // Lấy chữ cái ngẫu nhiên từ a-z
        char randomLetter = (char) ('a' + new Random().nextInt(26));

>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
        // Tạo số ngẫu nhiên 3 chữ số
        int randomNumber = new Random().nextInt(1000); // Từ 0 đến 999
        String randomNumberStr = String.format("%03d", randomNumber); // Đảm bảo có 3 chữ số

<<<<<<< HEAD
        // Ghép lại thành paymentID
        this.bookingID = "BOK" + datePart + randomNumberStr;
    }
    @Override
    public String toString() {
        return "Booking{" +
                "bookingID=" + bookingID +
                // Tránh gọi đến User ở đây
                '}';
    }

=======
        // Ghép lại thành bookingID
        this.bookingID = randomLetter + datePart + randomNumberStr;
    }
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
}

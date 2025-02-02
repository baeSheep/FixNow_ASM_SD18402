package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "Users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;

    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private int phoneNumber;
    private String address;
    private String userType;
    private String gender;
    private String image;
    @OneToMany(mappedBy = "user")
    private List<Booking> bookings;

    @OneToMany(mappedBy = "provider")
    private List<Booking> providedServices;
<<<<<<< HEAD
    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                // Không gọi Booking ở đây nếu có quan hệ
                '}';
    }
=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
}

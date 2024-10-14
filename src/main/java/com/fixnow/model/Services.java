package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "services") // Đảm bảo rằng tên bảng trong CSDL là 'services'
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Services {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer serviceID;

    private String name;
    private String image;
    private String description;
    private Double price;
    private String status;

    @ManyToOne
    @JoinColumn(name = "CategoryID", nullable = true)
    private Category category; // Đảm bảo Category cũng được đánh dấu là @Entity
}

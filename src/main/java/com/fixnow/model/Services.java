package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "services") // Tên bảng trong CSDL
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
    @JoinColumn(name = "CategoryID", nullable = true) // Tên cột liên kết với bảng Category
    private Category category; // Mối quan hệ với entity Category
}

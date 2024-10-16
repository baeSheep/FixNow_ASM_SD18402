package com.fixnow.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Entity
@Table(name = "Categories")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryID;

    @Column(name = "CategoryName") // Đặt tên cột chính xác từ database
    private String categoryName;

    @Column(name = "Description") // Đảm bảo tên cột khớp với CSDL
    private String description;

    @OneToMany(mappedBy = "category")
    private List<Services> services;
}

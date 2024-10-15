package com.fixnow.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.fixnow.model.Services;

public interface ServicesDao extends JpaRepository<Services, Integer> {

    // Tìm dịch vụ theo danh mục
    List<Services> findByCategoryCategoryName(String categoryName);

    // Tìm dịch vụ theo tên (không phân biệt chữ hoa chữ thường)
    List<Services> findByNameContainingIgnoreCase(String name);

    // Tìm dịch vụ theo từ khóa
    @Query("SELECT s FROM Services s WHERE LOWER(s.name) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Services> searchByKeyword(@Param("keyword") String keyword);
}

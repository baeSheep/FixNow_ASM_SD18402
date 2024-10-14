package com.fixnow.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.fixnow.model.Services;

public interface ServicesDao extends JpaRepository<Services, Integer> {
    List<Services> findByCategoryCategoryName(String categoryName);
    List<Services> findByNameContainingIgnoreCase(String name);
}

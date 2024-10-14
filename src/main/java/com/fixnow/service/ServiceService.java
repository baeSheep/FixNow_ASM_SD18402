package com.fixnow.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fixnow.dao.ServicesDao;
import com.fixnow.model.Services;

@Service
public class ServiceService {

    @Autowired
    private ServicesDao servicesDao;

    // Tìm dịch vụ theo từ khóa
    public List<Services> searchByKeyword(String name) {
        if (name == null || name.trim().isEmpty()) {
            return List.of(); // Trả về danh sách rỗng nếu không có từ khóa
        }
        return servicesDao.searchByKeyword(name); // Tìm kiếm theo từ khóa
    }

    // Tìm dịch vụ theo danh mục
    public List<Services> findByCategoryName(String categoryName) {
        return servicesDao.findByCategoryCategoryName(categoryName);
    }
}

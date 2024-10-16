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
	   public Services getServiceById(Integer serviceId) {
	        return servicesDao.findById(serviceId).orElse(null); // Trả về null nếu không tìm thấy
	    }
    // Tìm dịch vụ theo từ khóa
    public List<Services> searchByKeyword(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return List.of(); // Trả về danh sách rỗng nếu không có từ khóa
        }
        return servicesDao.searchByKeyword(keyword); // Tìm kiếm theo từ khóa
    }

    // Tìm dịch vụ theo danh mục
    public List<Services> findByCategoryName(String categoryName) {
        return servicesDao.findByCategoryCategoryName(categoryName);
    }

    // Tìm dịch vụ theo tên
    public List<Services> findByNameContainingIgnoreCase(String name) {
        return servicesDao.findByNameContainingIgnoreCase(name);
    }
    public Services findById(Integer serviceId) {
        return servicesDao.findById(serviceId).orElse(null);
    }
    
}

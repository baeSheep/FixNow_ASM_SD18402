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

    public List<Services> searchByName(String name) {
        return servicesDao.findByNameContainingIgnoreCase(name);
    }

    public List<Services> findByCategoryName(String categoryName) {
        return servicesDao.findByCategoryCategoryName(categoryName);
    }
}

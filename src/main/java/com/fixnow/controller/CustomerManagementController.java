package com.fixnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CustomerManagementController {

    @Autowired
    private UserDao userDao;

    @GetMapping("/management")
    public String showManagementPage(Model model) {
        // Lấy danh sách người dùng từ database
        List<User> users = userDao.findAll();

        // Phân loại người dùng theo userType
        List<User> regularUsers = users.stream()
                .filter(user -> "user".equals(user.getUserType()))
                .collect(Collectors.toList());

        List<User> providers = users.stream()
                .filter(user -> "provider".equals(user.getUserType()))
                .collect(Collectors.toList());

        // Gửi danh sách người dùng và nhà cung cấp đến view
        model.addAttribute("regularUsers", regularUsers);
        model.addAttribute("providers", providers);

        return "admin/templates/layout/customerManagement"; // Trả về trang JSP quản lý
    }
}

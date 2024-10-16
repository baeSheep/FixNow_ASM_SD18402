package com.fixnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.fixnow.dao.UserDao;
import com.fixnow.model.User;
import com.fixnow.service.SessionService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CustomerManagementController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private SessionService sessionService; // Inject SessionService

    // Hiển thị danh sách người dùng
    @GetMapping("/management")
    public String listUsers(Model model) {
        List<User> regularUsers = userDao.findAll();
        model.addAttribute("regularUsers", regularUsers);
        
        // Lấy thông tin người dùng từ SessionService
        model.addAttribute("userName", sessionService.get("userName"));
        model.addAttribute("userRole", sessionService.get("userRole"));
        
        return "admin/templates/layout/main-layout"; // Thay đổi thành tên view của bạn
    }

    // Cập nhật thông tin người dùng
    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user) {
        userDao.save(user); // Lưu người dùng, phương thức save() sẽ thực hiện cập nhật nếu ID đã tồn tại
        return "redirect:/management"; // Chuyển hướng về danh sách người dùng
    }

    // Xóa người dùng
    @PostMapping("/delete")
    public String deleteUser(@RequestParam("id") String userId) {
        Integer id = Integer.valueOf(userId); // Chuyển đổi từ String sang Integer
        userDao.deleteById(id); // Gọi phương thức deleteById với kiểu Integer
        return "redirect:/management"; // Chuyển hướng về danh sách người dùng
    }

    // Chỉnh sửa thông tin người dùng
    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable("id") Integer userId, Model model) {
        User user = userDao.findById(userId).orElse(null);
        model.addAttribute("user", user);
        
        // Lấy danh sách người dùng để hiển thị trong bảng
        List<User> regularUsers = userDao.findAll();
        model.addAttribute("regularUsers", regularUsers);
        
        // Lấy thông tin người dùng từ SessionService
        model.addAttribute("userName", sessionService.get("userName"));
        model.addAttribute("userRole", sessionService.get("userRole"));

        return "/admin/management"; // Thay đổi để chỉ định view chỉnh sửa người dùng
    }
}

package com.fixnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/management") // Đặt đường dẫn chung cho controller
public class CustomerManagementController {

    @Autowired
    private UserDao userDao;

    @GetMapping
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

    @PostMapping("/update") // Đường dẫn cho cập nhật người dùng
    public String updateUser(@ModelAttribute User user) {
        // Xử lý mật khẩu nếu có thay đổi
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            // Nếu không có mật khẩu mới, giữ nguyên mật khẩu cũ
            User existingUser = userDao.findById(user.getUserID()).orElseThrow(() -> new RuntimeException("User not found"));
            user.setPassword(existingUser.getPassword());
        }
        userDao.save(user); // Lưu thông tin người dùng đã cập nhật vào database
        return "redirect:/management"; // Quay lại trang quản lý
    }


    @PostMapping("/delete") // Đường dẫn cho xóa người dùng
    public String deleteUser(@RequestParam Integer id) {
        userDao.deleteById(id); // Xóa người dùng khỏi database
        return "redirect:/management"; // Quay lại trang quản lý
    }

    @GetMapping("/edit/{id}") // Đường dẫn cho trang chỉnh sửa
    public String showEditUserPage(@PathVariable Integer id, Model model) {
        Optional<User> userOptional = userDao.findById(id);
        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get()); // Thêm thông tin người dùng vào model
            return "admin/templates/layout/editUser"; // Trả về trang chỉnh sửa người dùng
        } else {
            return "redirect:/management"; // Nếu không tìm thấy người dùng, quay lại trang quản lý
        }
    }

}

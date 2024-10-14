package com.fixnow.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserDao userDao;

    @GetMapping("/home/login")
    public String showLogin() {
        return "loginkh/login"; // Trả về trang JSP login
    }

    @PostMapping("/home/login")
    public String login(Model model, 
                        @RequestParam("email") String email, 
                        @RequestParam("password") String password, 
                        HttpSession session) { // Thêm HttpSession vào phương thức
        try {
            // Tìm kiếm người dùng theo email
            User user = userDao.findByEmail(email);
            if (user == null) {
                model.addAttribute("error", "Invalid email"); // Người dùng không tồn tại
                return "loginkh/login"; // Quay lại trang login
            }
            if (!user.getPassword().equals(password)) { 
                model.addAttribute("error", "Invalid password"); // Mật khẩu không đúng
                return "loginkh/login"; // Quay lại trang login
            } else {
                // Lưu tên và vai trò vào phiên
                session.setAttribute("userName", user.getFirstName()); // Lưu tên
                session.setAttribute("userRole", user.getUserType()); // Lưu vai trò

                // Kiểm tra userType để điều hướng đến trang phù hợp
                if ("admin".equals(user.getUserType())) {
                    return "redirect:/admin/dashboard"; // Trang dành cho admin
                } else {
                    return "redirect:/home/index"; // Trang dành cho user
                }
            }
        } catch (Exception e) {
            model.addAttribute("error", "An error occurred during login"); // Xử lý lỗi
        }
        return "loginkh/login"; // Quay lại trang login
    }
}

package com.fixnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;

@Controller
public class RegisterController {

    @Autowired
    private UserDao userDao;

    @GetMapping("/home/register")
    public String showRegisterForm() {
        return "loginkh/register"; // Đảm bảo tên file JSP là register.jsp
    }

    @PostMapping("/home/register")
    public String registerUser(Model model,
    		 @RequestParam("firstname") String firstname,
    		 @RequestParam("lastname") String lastname,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password,
                               @RequestParam("confirm-password") String confirmPassword) {
        
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu không khớp!");
            return "loginkh/register"; // Trở lại form đăng ký nếu có lỗi
        }

        // Kiểm tra xem email đã tồn tại chưa
        if (userDao.findByEmail(email) != null) {
            model.addAttribute("error", "Email đã được sử dụng!");
            return "loginkh/register"; // Trở lại form đăng ký nếu có lỗi
        }

        // Tạo người dùng mới
        User newUser = new User();
        newUser.setFirstName(firstname);
        newUser.setFirstName(lastname);
        newUser.setEmail(email);
        newUser.setPassword(password); // Lưu ý: Mật khẩu nên được mã hóa trước khi lưu vào DB
        newUser.setUserType("user"); // Giá trị mặc định cho userType

        userDao.save(newUser); // Lưu người dùng vào database

        model.addAttribute("success", "Đăng ký thành công!"); // Thêm thông báo thành công
        return "redirect:/home/login"; // Chuyển hướng đến trang đăng nhập
    }
}

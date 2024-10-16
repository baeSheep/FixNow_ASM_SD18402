package com.fixnow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
<<<<<<< HEAD
import com.fixnow.dao.UserDao;
import com.fixnow.model.User;
import com.fixnow.service.SessionService;

import java.util.List;

@Controller
@RequestMapping("/admin")
=======

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/management") // Đặt đường dẫn chung cho controller
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
public class CustomerManagementController {

    @Autowired
    private UserDao userDao;

<<<<<<< HEAD
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
=======
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

>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
}

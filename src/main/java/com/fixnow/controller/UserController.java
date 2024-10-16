package com.fixnow.controller;

<<<<<<< HEAD
import java.io.File;
import java.io.IOException;
=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
import java.security.Principal;
import java.util.List;

import org.eclipse.jdt.internal.compiler.apt.model.ModuleElementImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
<<<<<<< HEAD
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;
import com.fixnow.service.SessionService;

<<<<<<< HEAD
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserDao dao;
	@Autowired
	SessionService session;
	@GetMapping("/fixnow")
	public String showHome() {
		
		return"loginkh/index";
	}
	
<<<<<<< HEAD
	
=======
	@GetMapping("cart")
	public String showCart() {
		return "loginkh/dichvu/cart";
	}
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3
	@GetMapping("pay")
	public String showPaymentForm(Model model) {
	    // Lấy thông tin người dùng từ SessionService
	    User user = session.get("user"); // "user" là key mà bạn đã sử dụng để lưu thông tin người dùng trong session

	    // Nếu không có thông tin người dùng trong session, có thể xử lý theo ý bạn (ví dụ: redirect đến trang đăng nhập)
	    if (user == null) {
	        return "redirect:/home/login"; // Hoặc trang phù hợp khác
	    }

	    model.addAttribute("user", user);
	    return "loginkh/dichvu/pay"; // Đường dẫn đến trang thanh toán
	}
	@GetMapping("infor")
	public String showin4(Model model) {
		User user = session.get("user");
		 if (user == null) {
		        return "redirect:/home/login"; // Hoặc trang phù hợp khác
		    }
		 model.addAttribute("user",user);
		return "loginkh/user/infor";
	
	}

<<<<<<< HEAD
	@PostMapping("/updateUserInfo")
    public String updateUserInfo(
            @RequestParam("first_name") String firstName,
            @RequestParam("last_name") String lastName,
            @RequestParam("gender") String gender,
            @RequestParam("address") String address,
            @RequestParam("phone_number") Integer phoneNumber,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("imageUpload") MultipartFile imageUpload,
            Model model,
            HttpServletRequest request) { // Thêm HttpServletRequest vào tham số

        User user = session.get("user"); // Lấy thông tin người dùng từ session

        if (user == null) {
            return "redirect:/home/login"; // Redirect nếu không có thông tin người dùng
        }

        // Cập nhật thông tin người dùng
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setGender(gender);
        user.setAddress(address);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setPassword(password);

        // Xử lý upload hình ảnh
        if (!imageUpload.isEmpty()) {
            try {
                // Lấy ServletContext từ HttpServletRequest
                ServletContext servletContext = request.getServletContext();
                String uploadDir = servletContext.getRealPath("/static/img/");
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
                }

                // Tạo tên file duy nhất
                String fileName = System.currentTimeMillis() + "_" + imageUpload.getOriginalFilename();
                // Lưu file vào thư mục
                File file = new File(dir, fileName);
                imageUpload.transferTo(file);
                user.setImage(fileName); // Cập nhật tên file vào user

                System.out.println("File uploaded successfully: " + file.getAbsolutePath()); // Kiểm tra đường dẫn file
            } catch (IOException e) {
                e.printStackTrace(); // In ra thông báo lỗi
                model.addAttribute("uploadError", "Không thể upload hình ảnh: " + e.getMessage());
                return "loginkh/user/infor"; // Trở lại trang thông tin người dùng
            }
        }

        // Cập nhật thông tin người dùng vào cơ sở dữ liệu
        dao.save(user);

        // Cập nhật lại thông tin trong session
        session.set("user", user);
        model.addAttribute("user", user);
        model.addAttribute("uploadSuccess", "Cập nhật thành công!"); // Thông báo thành công

        return "redirect:/user/infor"; // Redirect về trang thông tin người dùng
    }


=======
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3

}

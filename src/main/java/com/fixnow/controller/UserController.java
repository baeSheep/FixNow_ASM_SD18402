package com.fixnow.controller;

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

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;
import com.fixnow.service.SessionService;

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
	
	@GetMapping("cart")
	public String showCart() {
		return "loginkh/dichvu/cart";
	}
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


}

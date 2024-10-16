package com.fixnow.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fixnow.dao.BookingDao;
import com.fixnow.dao.ServicesDao;
import com.fixnow.model.Booking;
import com.fixnow.model.Services;
import com.fixnow.model.User;
import com.fixnow.service.SessionService;
import com.fixnow.service.UserService;

@Controller
@RequestMapping("/user")
public class CartController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private UserService userService;

	@Autowired
	private BookingDao bookingDao;

	@Autowired
	private ServicesDao serviceDao; // Thêm vào nếu bạn cần lấy dịch vụ

	// Hiển thị giỏ hàng với các dịch vụ từ bảng booking theo user ID
	@GetMapping("/cart")
	public String showCart(Model model) {
		// Lấy thông tin người dùng từ session
		User currentUser = sessionService.get("user");

		if (currentUser == null) {
			return "redirect:/home/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
		}

		// Lấy danh sách booking của người dùng
		List<Booking> cartItems = bookingDao.findByUser_UserID(currentUser.getUserID());



		// Đưa dữ liệu vào model để hiển thị trong view
		model.addAttribute("cartItems", cartItems);

		return "loginkh/dichvu/cart"; // Trả về trang giỏ hàng
	}

	// Thêm dịch vụ vào giỏ hàng
	@PostMapping("/cart/add")
	public String addServiceToCart(@RequestParam("serviceId") Integer serviceId, Model model) {
		User user = sessionService.get("user"); // Lấy thông tin người dùng từ session

		if (user == null) {
			model.addAttribute("error", "Bạn phải đăng nhập để thêm dịch vụ vào giỏ hàng.");
			return "redirect:/home/login"; // Chuyển hướng đến trang đăng nhập
		}

		// Lấy dịch vụ dựa trên serviceId
		Services service = serviceDao.findById(serviceId).orElse(null); // Thay đổi để gọi từ ServiceDao

		// Kiểm tra xem dịch vụ có tồn tại không
		if (service == null) {
			model.addAttribute("error", "Dịch vụ không tồn tại.");
			return "redirect:/user/cart"; // Chuyển hướng về giỏ hàng nếu dịch vụ không tồn tại
		}

		Booking booking = new Booking();

		// Thiết lập thông tin cho booking
		booking.generateBookingID();
		booking.setUser(user); // Gán người dùng vào booking
		booking.setService(service);
		booking.setBookingDate(new Date());
		booking.setStatus("Đang Xử Lý");
		booking.setPaymentStatus("Chưa Thanh Toán");
		booking.setNotes(""); // Ghi chú có thể để trống

		bookingDao.save(booking); // Lưu booking vào cơ sở dữ liệu

		return "redirect:/user/cart"; // Chuyển hướng về giỏ hàng
	}

	@RequestMapping("/cart/delete/{bookingID}/{userid}")
	public String deleteBookingForUser(@PathVariable("bookingID") String bookingID, @PathVariable("userid") Integer userid) {
	    bookingDao.deleteBookingByBookingIDAndUserID(bookingID, userid); // Xoá đơn hàng với `bookingID` và `userid`
	    return "redirect:/user/cart";
	}




}

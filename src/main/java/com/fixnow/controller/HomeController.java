package com.fixnow.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fixnow.dao.ServicesDao;
import com.fixnow.model.Services;
import com.fixnow.service.ServiceService;
import com.fixnow.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("home")
public class HomeController {
    @Autowired
    ServicesDao dao;

    @Autowired
    ServiceService serviceService;

    @Autowired
    SessionService session;

    @GetMapping("/index")
    public String showIndex(Model model) {
        // Lấy danh sách các dịch vụ theo từng danh mục cụ thể
        List<Services> giaDungServices = dao.findByCategoryCategoryName("Gia dụng");
        List<Services> dienTuServices = dao.findByCategoryCategoryName("Điện tử");
        List<Services> dienLanhServices = dao.findByCategoryCategoryName("Điện lạnh");
        List<Services> veSinhServices = dao.findByCategoryCategoryName("Vệ sinh");

        // Đưa danh sách vào model để truyền sang view (JSP)
        model.addAttribute("giaDungServices", giaDungServices);
        model.addAttribute("dienTuServices", dienTuServices);
        model.addAttribute("dienLanhServices", dienLanhServices);
        model.addAttribute("veSinhServices", veSinhServices);
        
        return "index";  // Trả về trang JSP
    }
    
    @GetMapping("/search")
    public String searchServices(@RequestParam("query") String query, Model model, HttpServletRequest request) {
        // Tìm tất cả dịch vụ theo tên    
    	System.out.println("Searching for: " + query); // Logging

        List<Services> allServices = serviceService.searchByName(query);

        List<Services> giaDungServices = serviceService.findByCategoryName("Gia Dụng").stream()
                .filter(service -> service.getName().toLowerCase().contains(query.toLowerCase()))
                .collect(Collectors.toList());

            List<Services> dienTuServices = serviceService.findByCategoryName("Điện Tử").stream()
                .filter(service -> service.getName().toLowerCase().contains(query.toLowerCase()))
                .collect(Collectors.toList());

            List<Services> dienLanhServices = serviceService.findByCategoryName("Điện Lạnh").stream()
                .filter(service -> service.getName().toLowerCase().contains(query.toLowerCase()))
                .collect(Collectors.toList());

            List<Services> veSinhServices = serviceService.findByCategoryName("Vệ Sinh").stream()
                .filter(service -> service.getName().toLowerCase().contains(query.toLowerCase()))
                .collect(Collectors.toList());
        // Kiểm tra nếu là AJAX request
        if (isAjax(request)) {
            model.addAttribute("giaDungServices", giaDungServices);
            model.addAttribute("dienTuServices", dienTuServices);
            model.addAttribute("dienLanhServices", dienLanhServices);
            model.addAttribute("veSinhServices", veSinhServices);
            return "search-results :: results"; // Trả về nội dung cho AJAX
        }

        model.addAttribute("giaDungServices", giaDungServices);
        model.addAttribute("dienTuServices", dienTuServices);
        model.addAttribute("dienLanhServices", dienLanhServices);
        model.addAttribute("veSinhServices", veSinhServices);
        return "index"; // Trả về view index.jsp
    }

    @GetMapping("/loginnv")
    public String showLoginNV() {
        return "loginnv/register";
    }

    @GetMapping("/logout")
    public String logout() {
        session.remove("user");
        return "redirect:/home/login";
    }

    // Phương thức kiểm tra yêu cầu AJAX
    private boolean isAjax(HttpServletRequest request) {
        String ajaxHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxHeader);
    }
}

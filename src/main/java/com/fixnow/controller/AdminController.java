package com.fixnow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        model.addAttribute("content", "dashboard");  // Specify the content to include
        return "admin/templates/layout/main-layout";  // Path to main layout
    }
    
    @RequestMapping("/manageUsers")
    public String manageUsers(Model model) {
        model.addAttribute("content", "customerManagement"); // Specify the content to include
        return "admin/templates/layout/main-layout"; // Path to main layout
    }

    @RequestMapping("/manageServiceProviders")
    public String manageServiceProviders(Model model) {
        model.addAttribute("content", "serviceProviderManagement"); // Specify the content to include
        return "admin/templates/layout/main-layout"; // Path to main layout
    }
    
    @RequestMapping("/payment")
    public String payment(Model model) {
        model.addAttribute("content", "paymentManagement"); // Specify the content to include
        return "admin/templates/layout/main-layout"; // Path to main layout
    }
}

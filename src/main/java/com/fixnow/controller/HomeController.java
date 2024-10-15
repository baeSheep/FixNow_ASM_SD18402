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
    public String showIndex(@RequestParam(value = "query", required = false) String query, Model model) {
        // Load all services by their categories
        List<Services> giaDungServices = dao.findByCategoryCategoryName("Gia dụng");
        List<Services> dienTuServices = dao.findByCategoryCategoryName("Điện tử");
        List<Services> dienLanhServices = dao.findByCategoryCategoryName("Điện lạnh");
        List<Services> veSinhServices = dao.findByCategoryCategoryName("Vệ sinh");

        // Add the lists to the model
        model.addAttribute("giaDungServices", giaDungServices);
        model.addAttribute("dienTuServices", dienTuServices);
        model.addAttribute("dienLanhServices", dienLanhServices);
        model.addAttribute("veSinhServices", veSinhServices);

        // If there is a search query, handle it
        if (query != null && !query.trim().isEmpty()) {
            List<Services> allServices = serviceService.searchByKeyword(query);
            model.addAttribute("allServices", allServices);

            // Notify if no services found
            if (allServices.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy dịch vụ nào phù hợp với từ khóa '" + query + "'.");
            }
        }

        return "index";  // Ensure this is the correct view
    }
    @GetMapping("/search")
    public String searchServices(@RequestParam("query") String query, Model model) {
        // Log the search query
        System.out.println("Search keyword: " + query);

        // Validate the query
        if (query == null || query.trim().isEmpty()) {
            model.addAttribute("message", "Vui lòng nhập từ khóa tìm kiếm.");
            return "viewindex/searchResults"; // Return search results page with a message
        }

        // Search for services by keyword
        List<Services> allServices = serviceService.searchByKeyword(query);

        // Filter services by category
        List<Services> giaDungServices = allServices.stream()
                .filter(service -> service.getCategory() != null && 
                                  "Gia Dụng".equalsIgnoreCase(service.getCategory().getCategoryName()))
                .collect(Collectors.toList());

        List<Services> dienTuServices = allServices.stream()
                .filter(service -> service.getCategory() != null && 
                                 "Điện Tử".equalsIgnoreCase(service.getCategory().getCategoryName()))
                .collect(Collectors.toList());

        List<Services> dienLanhServices = allServices.stream()
                .filter(service -> service.getCategory() != null && 
                                  "Điện Lạnh".equalsIgnoreCase(service.getCategory().getCategoryName()))
               .collect(Collectors.toList());

        List<Services> veSinhServices = allServices.stream()
                .filter(service -> service.getCategory() != null && 
                                  "Vệ Sinh".equalsIgnoreCase(service.getCategory().getCategoryName()))
                .collect(Collectors.toList());

        // Add results to the model
        model.addAttribute("giaDungServices", giaDungServices);
        model.addAttribute("dienTuServices", dienTuServices);
        model.addAttribute("dienLanhServices", dienLanhServices);
        model.addAttribute("veSinhServices", veSinhServices);

        // Return the search results view
        return "viewindex/searchResults"; // Ensure this points to your search results view with the proper structure
    }



//    @GetMapping("/search")
//    public String searchServices(@RequestParam("query") String query, Model model) {
//        // Log the search query
//        System.out.println("Search keyword: " + query);
//
//        // Validate the query
//        if (query == null || query.trim().isEmpty()) {
//            model.addAttribute("message", "Vui lòng nhập từ khóa tìm kiếm.");
//            return "viewindex/searchResults"; // Return search results page with a message
//        }
//
//        // Search for services by keyword
//        List<Services> allServices = serviceService.searchByKeyword(query);
//        
//        // Log the number of search results
//        System.out.println("Number of search results: " + allServices.size());
//
//        // Check if any services were found
//        if (allServices.isEmpty()) {
//            model.addAttribute("message", "Không tìm thấy dịch vụ nào phù hợp với từ khóa '" + query + "'." );
//        }
//
//        // Update the model with search results
//        model.addAttribute("allServices", allServices); // Use a single list for results
//
//        // Log the sizes of services
//        System.out.println("Total Services Found: " + allServices.size());
//
//        // Return the HTML content for the search results
//        return "viewindex/searchResults"; // Use the HTML code in a separate JSP file
//    }


    @GetMapping("/loginnv")
    public String showLoginNV() {
        return "loginnv/register";
    }

    // Phương thức kiểm tra yêu cầu AJAX
    private boolean isAjax(HttpServletRequest request) {
        String ajaxHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxHeader);
    }
}

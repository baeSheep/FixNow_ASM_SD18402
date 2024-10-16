package com.fixnow.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fixnow.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Service
public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        User user = session.get("user");
        String error = "";

        // Kiểm tra nếu người dùng chưa đăng nhập
        if (user == null) {
            error = "Please login!";
        }
        // Nếu có lỗi, điều hướng đến trang login
        if (error.length() > 0) {
            session.set("security-uri", uri); // Lưu lại URI trước khi redirect
            response.sendRedirect("/home/login?error=" + error);
            return false;
        }
        return true;
    }
}

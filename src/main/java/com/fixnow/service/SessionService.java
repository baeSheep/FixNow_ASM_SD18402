package com.fixnow.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
    @Autowired
    HttpSession session; // Sử dụng HttpSession để quản lý session

    // Lưu đối tượng vào session với một key nhất định
    public <T> void set(String name, T value) {
        session.setAttribute(name, value);
    }

    // Lấy đối tượng từ session với key
    @SuppressWarnings("unchecked")
    public <T> T get(String name) {
        return (T) session.getAttribute(name);
    }

    // Xóa một đối tượng khỏi session
    public void remove(String name) {
        session.removeAttribute(name);
    }

    // Lấy giá trị từ session, nếu không tồn tại trả về giá trị mặc định
    @SuppressWarnings("unchecked")
    public <T> T get(String name, T defaultValue) {
        T value = (T) session.getAttribute(name);
        return value != null ? value : defaultValue;
    }
}

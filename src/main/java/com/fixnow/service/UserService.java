package com.fixnow.service;

import com.fixnow.dao.UserDao;
import com.fixnow.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao dao;

    public List<User> getAllUsers() {
        return dao.findAll();
    }

    public void saveUser(User user) {
        dao.save(user);
    }

    public void deleteUser(Integer id) {
        dao.deleteById(id);
    }

    public User getUserById(Integer id) {
        return dao.findById(id).orElse(null);
    }
    public User findByEmail(String username) {
        return dao.findByEmail(username); // Tìm người dùng dựa trên tên người dùng
    }
}

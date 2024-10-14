package com.fixnow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fixnow.model.User;

import java.util.List;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {
    
    // Tìm người dùng theo email
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findByEmail(String email);
    
    // Kiểm tra tồn tại người dùng theo email
    boolean existsByEmail(String email);
    
    // Tìm người dùng theo số điện thoại
    @Query("SELECT u FROM User u WHERE u.phoneNumber = ?1")
    User findByPhoneNumber(int phoneNumber);
    
    // Kiểm tra tồn tại người dùng theo số điện thoại
    boolean existsByPhoneNumber(int phoneNumber);
    
    // Tìm người dùng theo loại người dùng
    @Query("SELECT u FROM User u WHERE u.userType = ?1")
    List<User> findByUserType(String userType);
}

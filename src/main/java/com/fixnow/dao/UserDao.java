package com.fixnow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.fixnow.model.User;

public interface UserDao extends JpaRepository<User, Integer>{
	 @Query("SELECT u FROM User u WHERE u.email = ?1")
	    User findByEmail(String email);
	 boolean existsByEmail(String email);
}

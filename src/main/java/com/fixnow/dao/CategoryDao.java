package com.fixnow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fixnow.model.Category;

public interface CategoryDao extends JpaRepository<Category, Integer>{

}

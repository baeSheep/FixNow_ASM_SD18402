package com.fixnow.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fixnow.service.AuthInterceptor;

@Configuration
public class interConfig implements WebMvcConfigurer {

	@Autowired
	AuthInterceptor authInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor).addPathPatterns("/user/**","/admin/**") // Chặn tất cả các URL
				.excludePathPatterns("/assets/**", "/home/**", "/public/**", "/static/**"); // Không chặn các URL công
			// khai hoặc tài nguyên 
	}
} 	
package com.fixnow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = "com.fixnow")
@EnableJpaRepositories(basePackages = "com.fixnow.dao")
@EntityScan(basePackages = "com.fixnow.model") 
public class FixNowAsmSd18402Application {

	public static void main(String[] args) {
		SpringApplication.run(FixNowAsmSd18402Application.class, args);
	}

}

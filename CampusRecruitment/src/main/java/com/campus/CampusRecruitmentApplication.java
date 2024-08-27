package com.campus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication

@EnableAutoConfiguration
public class CampusRecruitmentApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(CampusRecruitmentApplication.class, args);
	}
	 @Override
	 protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	  return application.sources(CampusRecruitmentApplication.class);
	  
	 }
}

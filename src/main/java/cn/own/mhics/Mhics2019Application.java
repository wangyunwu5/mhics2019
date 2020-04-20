package cn.own.mhics;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/*
 * @SpringBootApplication public class Mhics2019Application {
 * 
 * public static void main(String[] args) {
 * SpringApplication.run(Mhics2019Application.class, args); }
 * 
 * }
 */
@SpringBootApplication
public class Mhics2019Application extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(Mhics2019Application.class, args);
	}
	
	public SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(Mhics2019Application.class);
	}

}

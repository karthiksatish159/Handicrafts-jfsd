package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication

public class Sdp03ProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(Sdp03ProjectApplication.class, args);
		System.out.println("Hello WOrd");
	}

}

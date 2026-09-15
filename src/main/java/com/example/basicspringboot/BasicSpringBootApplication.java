package com.example.basicspringboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {
        "com.example.basicspringboot",
        "ca.markham.engineeringdrawing"
})
public class BasicSpringBootApplication {
    public static void main(String[] args) {
        SpringApplication.run(BasicSpringBootApplication.class, args);
    }
}

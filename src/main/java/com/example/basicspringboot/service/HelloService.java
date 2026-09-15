package com.example.basicspringboot.service;

import com.example.basicspringboot.dto.HelloResponse;
import java.time.Instant;
import org.springframework.stereotype.Service;

@Service
public class HelloService {
    public HelloResponse createGreeting(String name) {
        String cleanedName = name == null || name.isBlank() ? "World" : name.trim();
        return new HelloResponse("Hello, " + cleanedName + "!", Instant.now());
    }
}


package com.example.basicspringboot.controller;

import com.example.basicspringboot.dto.HelloResponse;
import com.example.basicspringboot.service.HelloService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    private final HelloService helloService;

    public HelloController(HelloService helloService) {
        this.helloService = helloService;
    }

    @GetMapping("/api/hello")
    public HelloResponse hello(@RequestParam(defaultValue = "World") String name) {
        return helloService.createGreeting(name);
    }

    @GetMapping("/api/health")
    public String health() {
        return "OK";
    }
}


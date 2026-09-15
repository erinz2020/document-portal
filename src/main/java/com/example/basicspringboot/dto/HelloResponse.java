package com.example.basicspringboot.dto;

import java.time.Instant;

public record HelloResponse(
        String message,
        Instant timestamp
) {
}


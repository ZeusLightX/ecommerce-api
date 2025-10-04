package com.mgh.ecommerce;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.web.client.TestRestTemplate;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HelloControllerTest {
    @Autowired TestRestTemplate rest;

    @Test void hello_returns_greeting() {
        var body = rest.getForObject("/hello", String.class);
        assertThat(body).contains("Hello, E-commerce API!");
    }
}

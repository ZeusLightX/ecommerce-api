# ecommerce-api

![CI](https://github.com/ZeusLightX/ecommerce-api/actions/workflows/ci.yml/badge.svg)

Spring Boot (Java 21) e-commerce backend used to showcase AWS, Docker, Kubernetes, Jenkins, and CI/CD skills.

## Features (current → planned)
- ✅ Hello endpoint (GET /hello) and health (/actuator/health)
- ⏳ Products (CRUD), Carts, Orders, Auth (JWT), Price/Promo rules, Payments (mock), Async events (SQS/Kafka)
- ⏳ Observability: metrics, logs, distributed tracing
- ⏳ Deploy: Docker → registry → Kubernetes (Ingress, HPA) on AWS

## Tech Stack
- **Java 21**, **Spring Boot 3.5.x**, Maven
- **Testing:** JUnit 5, AssertJ, Spring Boot Test
- **Ops:** Spring Actuator; Docker multi-stage image; (later) Jenkins/GitHub Actions, K8s
- **DB (soon):** PostgreSQL + Spring Data JPA

## Run locally
'''Bash
./mvnw spring-boot:run
# http://localhost:8080/hello
# http://localhost:8080/actuator/health

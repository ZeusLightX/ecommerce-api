# ---------- build stage ----------
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Cache Maven wrapper + dependencies first (faster rebuilds)
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN ./mvnw -q -DskipTests dependency:go-offline

# Now add source and build
COPY src ./src
RUN ./mvnw -q -DskipTests package

# ---------- runtime stage ----------
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
ENV JAVA_OPTS="-XX:InitialRAMPercentage=50 -XX:MaxRAMPercentage=80"

# Copy the built jar from the first stage
COPY --from=build /app/target/*-SNAPSHOT.jar /app/app.jar

# Health endpoint (used later by Docker/K8s)
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/actuator/health || exit 1

EXPOSE 8080
ENTRYPOINT ["sh","-c","java  -jar /app/app.jar"]

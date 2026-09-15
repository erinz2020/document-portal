# Basic Spring Boot Project

A minimal Spring Boot REST API project.

## Requirements

- Java 17 or newer
- Maven 3.9+

## Run

```bash
mvn spring-boot:run
```

The API runs at:

```text
http://localhost:8080
```

## Endpoints

```text
GET /api/hello
GET /api/hello?name=Erin
GET /api/health
```

Example:

```bash
curl "http://localhost:8080/api/hello?name=Erin"
```

## Frontend

```bash
cd frontend
npm install
npm start
```

The Angular app runs at:

```text
http://localhost:4200
```

The frontend sends a GET request to:

```text
GET /api/engineering-documents/design-criteria
```

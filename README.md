# Document Portal

A minimal Spring Boot and Angular application for loading document records from an Oracle-backed database view.

## Requirements

- Java 17 or newer
- Maven 3.9+
- Node.js and npm

## Project Structure

```text
document-portal/
  src/main/java/com/example/documentportal/
    config/
    controller/
    dto/
    entity/
    repository/
    service/
    DocumentPortalApplication.java
  src/main/resources/application.properties
  frontend/
```

## Database Configuration

The backend connects to Oracle using environment variables for credentials:

```properties
spring.datasource.url=jdbc:oracle:thin:@//amanda-db-host:1521/AMANDA
spring.datasource.username=${AMANDA_DB_USERNAME}
spring.datasource.password=${AMANDA_DB_PASSWORD}
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
spring.jpa.hibernate.ddl-auto=none
```

Before running the backend, set:

```bash
export AMANDA_DB_USERNAME="your_username"
export AMANDA_DB_PASSWORD="your_password"
```

## Run Backend

```bash
mvn spring-boot:run
```

The API runs at:

```text
http://localhost:8080
```

## Endpoints

```text
GET /api/engineering-documents/design-criteria
```

Example:

```bash
curl "http://localhost:8080/api/engineering-documents/design-criteria"
```

## Run Frontend

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

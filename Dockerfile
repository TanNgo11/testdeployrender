# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml to the container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Set executable permissions for the Maven wrapper
RUN chmod +x mvnw

# Install the dependencies and package the application
RUN ./mvnw dependency:go-offline
RUN ./mvnw clean package -DskipTests

# Copy the jar file to the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
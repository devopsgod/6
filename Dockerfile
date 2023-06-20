# Use the official maven image to create a build artifact.
# https://hub.docker.com/_/maven
FROM maven:3.8.1-openjdk-11 as builder

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn clean install

# Use AdoptOpenJDK for base image.
# It's important to use OpenJDK (not Alpine) because of https://github.com/docker-library/openjdk/issues/211
FROM adoptopenjdk:11-jre-hotspot

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/target/*.jar /app.jar

# Run the web service on container startup. 
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

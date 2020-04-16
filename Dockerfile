FROM openjdk:8-jdk-alpine
MAINTAINER Lionel
EXPOSE 8080

COPY target/elephone-management.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
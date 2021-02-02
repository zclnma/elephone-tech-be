FROM azul/zulu-openjdk:11
MAINTAINER Lionel
EXPOSE 8080
ARG JAR_FILE=target/elephone-management.jar

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
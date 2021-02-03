ARG JAR_FILE=build/libs/management-1.0.0-SNAPSHOT.jar
FROM azul/zulu-openjdk-alpine:11.0.7-jre
MAINTAINER Lionel
EXPOSE 8080

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
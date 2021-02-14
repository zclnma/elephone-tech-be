FROM azul/zulu-openjdk-alpine:11.0.7-jre
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG JAR_FILE=build/libs/management-1.0.0-SNAPSHOT.jar
MAINTAINER Lionel
EXPOSE 8080

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
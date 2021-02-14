FROM azul/zulu-openjdk-alpine:11.0.7-jre
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG JAR_FILE=build/libs/management-1.0.0-SNAPSHOT.jar

ARG AWS_REGION
ARG AWS_DB_URL
ARG AWS_USERPOOL_ID
ARG AWS_COGNITO_URL
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_REGION=$AWS_REGION
ENV AWS_DB_URL=$AWS_DB_URL
ENV AWS_USERPOOL_ID=$AWS_USERPOOL_ID
ENV AWS_COGNITO_URL=$AWS_COGNITO_URL
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

EXPOSE 8080

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
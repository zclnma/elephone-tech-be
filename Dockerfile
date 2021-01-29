FROM azul/zulu-openjdk:11
MAINTAINER Lionel
EXPOSE 8080
ARG JAR_FILE=target/elephone-management.jar

#RUN apt-get update
#RUN apt-get upgrade -y
#RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi
#RUN wget http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.5/wkhtmltox-0.12.5_linux-trusty-amd64.deb
#RUN wkhtmltopdf http://www.google.com google.pdf

COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
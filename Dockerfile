FROM openjdk:17-oracle
VOLUME /tmp
COPY target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
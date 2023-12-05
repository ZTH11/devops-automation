FROM openjdk:17-oracle
VOLUME /tmp
COPY target/*.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]
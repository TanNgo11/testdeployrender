FROM openjdk:17

ARG JAR_FILE=target/*.jar

ADD ${JAR_FILE} testrender.jar

ENTRYPOINT ["java", "-jar", "testrender.jar"]

EXPOSE 80
FROM eclipse-temurin:11-jdk-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./App ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:20-ea-jdk-oraclelinux7
WORKDIR /adevguide
COPY --from=maven target/*.jar ./SimpleJavaProject.jar
CMD ["java", "-jar", "./SimpleJavaProject.jar"]

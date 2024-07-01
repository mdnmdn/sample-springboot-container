FROM amazoncorretto:21-al2-jdk AS builder
#FROM eclipse-temurin:21.0.2_13-jdk-jammy AS builder
RUN yum install -y tar gzip
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN ./mvnw  dependency:go-offline

COPY ./src ./src

RUN ./mvnw clean install

FROM amazoncorretto:21-al2023-headless AS production
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]
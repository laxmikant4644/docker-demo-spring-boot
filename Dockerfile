# syntax=docker/dockerfile:experimental
ARG JAR_NAME=app

FROM maven:3.6.3-openjdk-11-slim AS MAVEN_BUILD
ARG JAR_NAME
WORKDIR /build/
COPY pom.xml .
COPY src ./src/
RUN --mount=type=cache,target=/root/.m2 mvn package -Djar.finalName=${JAR_NAME}

FROM adoptopenjdk/openjdk11:jre11u-alpine-nightly
ARG JAR_NAME
ENV JAR_NAME=${JAR_NAME}
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/${JAR_NAME}.jar /app/
ENTRYPOINT java -jar /app/${JAR_NAME}.jar

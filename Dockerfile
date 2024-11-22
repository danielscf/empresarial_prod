FROM gradle:8-jdk17-corretto AS builder

WORKDIR /app

COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle/

RUN gradle dependencies --no-daemon

COPY . /app

RUN gradle build --no-daemon -x test

FROM amazoncorretto:17-alpine

WORKDIR /app

COPY --from=builder /app/build/libs/*.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]


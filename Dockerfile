FROM gradle:8-jdk17-corretto AS builder

WORKDIR /app

COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle/

RUN gradle dependencies --no-daemon

COPY . /app

RUN gradle build --no-daemon -x test

FROM amazoncorretto:17-alpine

WORKDIR /app

RUN mkdir -p /app/images/ && chmod -R 777 /app/images
RUN mkdir -p /app/photos/ && chmod -R 777 /app/photos
RUN mkdir -p /app/brand_images/ && chmod -R 777 /app/brand_images

COPY --from=builder /app/build/libs/*.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]


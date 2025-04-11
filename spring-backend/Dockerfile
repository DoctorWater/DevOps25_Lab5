FROM openjdk:17-alpine AS build

RUN apk add --no-cache maven

WORKDIR /app

COPY pom.xml .

COPY src src

RUN mvn clean package -DskipTests

FROM openjdk:17-alpine

RUN addgroup -S springgroup && adduser -S springuser -G springgroup

COPY --from=build /app/target/*.jar /app/app.jar

WORKDIR /app

RUN chown springuser:springgroup app.jar

USER springuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
FROM eclipse-temurin:17

COPY target/demo-0.0.2-SNAPSHOT.jar app.jar

EXPOSE 9090

ENTRYPOINT ["java","-jar","/app.jar"]


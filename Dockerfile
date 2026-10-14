FROM alpine:latest
RUN apk add --no-cache openjdk11
WORKDIR /app
COPY HelloDocker.java .
RUN javac HelloDocker.java
CMD ["java", "HelloDocker"]
FROM openjdk:11-jre-slim

RUN mkdir /app
WORKDIR /app

COPY build/libs/*.jar /app/
EXPOSE 8080

RUN echo "#!/bin/sh \n\
exec /usr/local/openjdk-11/bin/java -jar %s\n" "$(ls /app/*.jar)"\
 > /app/entrypoint.sh \
 && chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/bin/sh","/app/entrypoint.sh"]

FROM public.ecr.aws/amazoncorretto/amazoncorretto:17

ARG JAR_FILE=user-service-0.0.1-SNAPSHOT.jar
ENV JAR_FILE=${JAR_FILE}

COPY target/${JAR_FILE} /
COPY certs/* /

USER 1000
EXPOSE 8080
ENV TZ="Africa/Johannesburg"

ENTRYPOINT exec java ${JAVA_OPTS} -jar /${JAR_FILE}

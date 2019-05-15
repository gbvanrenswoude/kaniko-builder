FROM gcr.io/kaniko-project/executor:debug

ARG GIT_COMMIT=unknown
ARG BUILDER_IMAGE_ARG=unknown

LABEL description="Kaniko to build Docker containers"
LABEL commit=$GIT_COMMIT

COPY certs /kaniko/ssl/certs/

COPY build.sh /build.sh
RUN ["chmod", "+x", "/build.sh"]
ENTRYPOINT [""]
# CMD ["sh"]

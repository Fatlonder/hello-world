#!/bin/sh

# disconnect from Docker daemon
unset DOCKER_TLS_VERIFY DOCKER_CERT_PATH DOCKER_HOST

# build
./gradlew clean build

source ~/Documents/Notes/dockerhub_login.env
docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}
docker build --no-cache -t garystafford/hello-world:latest .
docker push garystafford/hello-world:latest

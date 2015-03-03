#!/bin/bash

docker build --no-cache -t template-spring-boot-build -f Dockerfile.build .
docker run -v $PWD/output:/tmp/output -v /root/.m2/repository:/root/.m2/repository template-spring-boot-build

docker build --no-cache -t template-spring-boot -f Dockerfile.run .
docker run -p 80:8080 template-spring-boot

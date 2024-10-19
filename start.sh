#!/bin/bash

# Build jenkins docker image
docker build -t nexus3:8082/jenkins jenkins/

# Compose up jenkins
docker-compose -f ./jenkins/docker-compose.yml up -d

# Compose up trivy
docker-compose -f ./trivy/docker-compose/yml up -d

# Compose up nexus
docker-compose -f ./nexus/docker-compose.yml up -d
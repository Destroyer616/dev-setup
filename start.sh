#!/bin/bash

# Build jenkins docker image
docker build -t jenkins jenkins/

# Compose up jenkins
docker-compose -f ./jenkins/jenkins-compose.yml up -d
docker exec -u root jenkins chmod 666 /var/run/docker.sock

# Compose up nexus
docker-compose -f ./nexus/nexus-compose.yml up -d

# Compose up sonarqube
docker-compose -f ./sonarqube/sonarqube-compose.yml up -d
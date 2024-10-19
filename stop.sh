#!/bin/bash

# Compose down jenkins
docker-compose -f ./jenkins/jenkins-compose.yml down

# Compose down nexus
docker-compose -f ./nexus/nexus-compose.yml down
#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {pause|unpause}"
    exit 1
fi

# Define the action based on the argument
ACTION=$1

# Execute the appropriate Docker Compose command based on the action
if [ "$ACTION" == "pause" ]; then
    echo "Pausing services..."
    docker-compose -f ./jenkins/jenkins-compose.yml pause
    docker-compose -f ./nexus/nexus-compose.yml pause
    docker-compose -f ./sonarqube/sonarqube-compose.yml pause
elif [ "$ACTION" == "unpause" ]; then
    echo "Unpausing services..."
    docker-compose -f ./jenkins/jenkins-compose.yml unpause
    docker-compose -f ./nexus/nexus-compose.yml unpause
    docker-compose -f ./sonarqube/sonarqube-compose.yml unpause
else
    echo "Invalid argument: $ACTION"
    echo "Usage: $0 {pause|unpause}"
    exit 1
fi

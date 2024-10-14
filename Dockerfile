# Use jenkins as the base image
FROM docker.io/jenkins/jenkins

# Install necessary packages
USER root
RUN apt update && apt install -y nano podman git maven

# Install nvm to manage nodejs and npm
USER root
RUN touch ~/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Set nexus docker hosted repo
COPY ./setup-registry.sh /var/jenkins_home/add_registry.sh
RUN chmod +x /var/jenkins_home/add_registry.sh
RUN /var/jenkins_home/add_registry.sh

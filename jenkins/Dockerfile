# Base image jenkins/jenkins
FROM ubuntu
# Env variable for trivy and docker ce cli versions
ENV trivy_version=0.56.1
ENV docker_ce_cli_version=27.3.1-1

RUN apt update

# Install necessary tools
RUN apt install -y wget2 openjdk-17-jdk maven git

# Download and install docker ce cli
RUN wget2 https://download.docker.com/linux/ubuntu/dists/noble/pool/stable/amd64/docker-ce-cli_${docker_ce_cli_version}~ubuntu.24.04~noble_amd64.deb 

# Install the downloaded Docker CE CLI package
RUN dpkg -i docker-ce-cli_*.deb && \
    rm -f docker-ce-cli_*.deb

# Install trivy client
RUN wget2 https://github.com/aquasecurity/trivy/releases/download/v${trivy_version}/trivy_${trivy_version}_Linux-64bit.tar.gz && \
    tar -xzf ./trivy*.tar.gz && \
    chmod +x trivy && \
    mv trivy /usr/local/bin && \
    rm -f trivy*.tar.gz

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Jenkins

# Set environment variables
ENV JENKINS_HOME=/var/jenkins_home


# Create Jenkins home directory
RUN mkdir -p ${JENKINS_HOME}

# Download the Jenkins WAR file
RUN wget2 https://get.jenkins.io/war-stable/latest/jenkins.war -O /usr/share/jenkins.war

# Expose the Jenkins port
EXPOSE 8080
EXPOSE 50000

# Set the entry point to run Jenkins
CMD ["java", "-jar", "/usr/share/jenkins.war"]
# Use jenkins as the base image
FROM docker.io/library/ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y --no-install-recommends \
    wget2 \
    openjdk-17-jdk \
    maven \
    curl \
    gnupg \
    ca-certificates \
    apt-transport-https \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu noble stable" \
    > /etc/apt/sources.list.d/docker.list \
    && apt update && apt install -y --no-install-recommends \
    docker-ce-cli \
    fontconfig \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variable for jenkins version and jenkins home
ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_VERSION=2.462.3
ENV TRIVY_VERSION=0.56.2

# Create the Jenkins home directory
RUN mkdir -p $JENKINS_HOME

# Download the Jenkins WAR file
RUN wget2 https://get.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war -O /usr/share/jenkins.war

# Install trivy client
RUN wget2 https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz && tar -xzf ./trivy*.tar.gz && chmod +x trivy && mv trivy /usr/local/bin

# Expose the Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins.war"]
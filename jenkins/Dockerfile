# Use jenkins as the base image
FROM docker.io/library/ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y wget2 openjdk-21-jdk maven docker.io

# Set environment variable for jenkins version and jenkins home
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_VERSION 2.462.3
ENV TRIVY_VERSION v0.56.2

# Create the Jenkins home directory
RUN mkdir -p $JENKINS_HOME

# Download the Jenkins WAR file
RUN wget2 https://get.jenkins.io/war-stable/$JENKINS_VERSION/jenkins.war -O /usr/share/jenkins.war

# Copy add registry script and run it
COPY add-registry.sh /opt/add-registry.sh
RUN chmod +x /opt/add-registry.sh && /opt/add-registry.sh

# Install trivy client
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin ${TRIVY_VERSION}

# Expose the Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins.war"]
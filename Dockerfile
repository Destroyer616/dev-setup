# Use UBI9 as the base image
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Install necessary packages
RUN microdnf install -y \
    java-17-openjdk-devel \
    git \
    wget \
    unzip \
    tar \
    shadow-utils \
    podman \
    sudo && \
    microdnf clean all

# Install Jenkins
RUN wget -q -O /tmp/jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war && \
    mkdir -p /opt/jenkins && \
    mv /tmp/jenkins.war /opt/jenkins/jenkins.war

# Create Jenkins user and set permissions
RUN useradd -m -d /var/jenkins_home -s /bin/bash jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set environment variables for Jenkins
ENV JENKINS_HOME=/var/jenkins_home \
    JENKINS_WAR=/opt/jenkins/jenkins.war \
    PATH=$PATH:/opt/jenkins

EXPOSE 8080 50000

# Set nexus docker hosted repo
COPY ./setup-registry.sh /usr/local/bin/add_registry.sh
RUN chmod +x /usr/local/bin/add_registry.sh
RUN /usr/local/bin/add_registry.sh

# Set root as the default user
USER root

# Start Jenkins and Docker in the background
CMD ["/bin/bash", "-c", "java -jar /opt/jenkins/jenkins.war"]


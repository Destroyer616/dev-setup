# Base image jenkins/jenkins
FROM docker.io/jenkins/jenkins

# Env variable for trivy and docker ce cli versions
ENV trivy_version=0.56.1
ENV docker_ce_cli_version=27.3.1-1

# Updates
USER root
RUN apt update

# Install necessary tools
RUN apt install -y wget2

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

USER jenkins

# Install nvm
RUN touch ~/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
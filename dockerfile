# Use Ubuntu as the base image
FROM ubuntu:latest
 
# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
 
# Install Docker CLI and Docker Compose
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
 
# Set the working directory
WORKDIR /app
 
# Pull hyperledger/fabric-tools:2.3
FROM hyperledger/fabric-tools:2.3
 
# Set the working directory
WORKDIR /app
 
# Command to start your application or other configurations
CMD ["/bin/bash"]

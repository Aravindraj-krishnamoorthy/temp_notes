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

RUN curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh && \
    apt install nano

# Set the working directory
WORKDIR /

# Command to start your application or other configurations
CMD ["/bin/bash"]


apiVersion: v1
kind: Pod
metadata:
  name: dind-pod
spec:
  containers:
  - name: dind-container
    image: docker:latest
    securityContext:
      privileged: true
    volumeMounts:
    - name: docker-socket
      mountPath: /var/run/docker.sock
  volumes:
  - name: docker-socket
    hostPath:
      path: /var/run/docker.sock

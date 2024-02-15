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


FROM ubuntu:focal
SHELL ["/bin/bash", "-c"]
# Install baseline packages
RUN apt-get update && \
 DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
 apt-transport-https \
 bash \
 build-essential \
 ca-certificates \
 curl \
 dbus \
 dnsutils \
 docker.io \
 gnupg-agent \
 htop \
 iptables \
 iproute2 \
 iputils-ping \
 jq \
 kmod \
 libsystemd0 \
 locales \
 lsb-release \
 man \
 openssh-server \
 python3 \
 python3-pip \
 rsyslog \
 software-properties-common \
 sudo \
 systemd \
 systemd-sysv \
 udev \
 unzip \
 vim \
 wget && \
 # Install Docker using official repository
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add — && \
 apt-key fingerprint 0EBFCD88 && \
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
 apt-get update && apt-get install --no-install-recommends --yes \
 docker-ce \
 docker-ce-cli \
 containerd.io && \
 # Install latest Git using their official PPA
 add-apt-repository ppa:git-core/ppa && \
 DEBIAN_FRONTEND="noninteractive" apt-get install --yes git && \
 # Housekeeping
 apt-get autoremove --yes && \
 apt-get clean --yes && \
 rm -rf \
 /tmp/* \
 /var/lib/apt/lists/* \
 /var/tmp/*
# Prevents journald from reading kernel messages from /dev/kmsg
RUN echo "ReadKMsg=no" >> /etc/systemd/journald.conf
# Create default ‘admin/admin’ user
RUN useradd admin \
 --create-home \
 --shell /bin/bash \
 --groups docker \
 --uid=1000 \
 --user-group && \
 echo "admin:admin" | chpasswd && \
 echo "admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/admin && \
 mkdir /home/admin/.ssh && \
 chown admin:admin /home/admin/.ssh
# Make use of stopsignal (instead of sigterm) to stop systemd containers.
STOPSIGNAL SIGRTMIN+3
# Expose OpenSSH server
EXPOSE 22
# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", " — log-level=err" ]

                                                            
FROM registry.nestybox.com/nestybox/ubuntu-bionic-systemd-docker

# Install necessary tools
RUN apt-get update && \
    apt-get -y install curl nano software-properties-common

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Add Git PPA repository and install Git
RUN add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes git

# Set working directory
WORKDIR /

# Start systemd
CMD ["/sbin/init"]

# temp_notes

https://blog.nestybox.com/2022/01/03/dink.html

https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-k8s.md

wget -q https://aka.ms/installazurecli-linux
curl -L https://aka.ms/installazurecli-linux --output installazurecli-linux
sudo bash installazurecli-linux


  GNU nano 7.2                                                     dockerfile                                                              
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

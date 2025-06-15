FROM jenkins/inbound-agent:latest

USER root

# Environment variable for Terraform version
ENV TERRAFORM_VERSION=1.7.5

# Install tools
RUN apt-get update && \
    apt-get install -y unzip curl git gnupg software-properties-common && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform awscli && \
    apt-get clean

USER jenkins
WORKDIR /home/jenkins/agent

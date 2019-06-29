# Use an official Python runtime as a parent image
FROM openjdk:8-jdk-alpine

# Install any needed packages specified in requirements.txt
RUN apk update && apk add openssh-client 

# Install git
RUN apk add git

RUN mkdir -p ~/.ssh

RUN printf "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config

    ## Install 3rd tools
RUN apk add jq  
RUN apk add python
RUN apk add bash
RUN apk add curl
RUN curl -sSL https://sdk.cloud.google.com > /tmp/gcl && chmod +x /tmp/gcl && bash /tmp/gcl --install-dir=/tmp/gcloud --disable-prompts
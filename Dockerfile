# Use an official Python runtime as a parent image
#FROM openjdk:8-jdk-alpine
FROM google/cloud-sdk:alpine
RUN apk --update add openjdk8

# Install any needed packages specified in requirements.txt
RUN apk update && apk add --no-cache --update openssh-client 

# Install git
RUN apk add --no-cache --update git

RUN mkdir -p ~/.ssh

RUN printf "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config

## Install 3rd tools
RUN apk add --no-cache --update jq  
RUN apk add --no-cache --update bash
RUN apk add --no-cache --update curl


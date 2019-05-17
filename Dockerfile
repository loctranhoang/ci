# Use an official Python runtime as a parent image
FROM openjdk:8-jdk-alpine

# Install any needed packages specified in requirements.txt
RUN apk update && apk add openssh-client 

# Install git
RUN apk add git

RUN mkdir -p ~/.ssh

RUN printf "Host *\n\tStrictHostKeyChecking no\nHost gitlab.azsofts.com\n\tHostName gitlab.azsofts.com\n\tUser gitlabci\n\tIdentityFile /root/.ssh/gitlab_gitlabci_private" > ~/.ssh/config


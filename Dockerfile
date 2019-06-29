# Use an official Python runtime as a parent image
FROM openjdk:8-jdk-alpine

# Install any needed packages specified in requirements.txt
RUN apk update && apk add --no-cache --update openssh-client 

# Install git
RUN apk add --no-cache --update git

RUN mkdir -p ~/.ssh

RUN printf "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config

    ## Install 3rd tools
RUN apk add --no-cache --update jq  
# RUN apk add python

######################
# Install Python 3.7
#######################
RUN apk add --no-cache --update linux-headers 
# Update & Install dependencies
RUN apk add --no-cache --update \
    git \
    bash \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    build-base \
    py-pip

# Set Python version
ARG PYTHON_VERSION='3.7.0'
# Set pyenv home
ARG PYENV_HOME=/root/.pyenv

# Install pyenv, then install python versions
RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME && \
    rm -rfv $PYENV_HOME/.git

ENV PATH $PYENV_HOME/shims:$PYENV_HOME/bin:$PATH

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pip install --upgrade pip && pyenv rehash

# Clean
RUN rm -rf ~/.cache/pip

###############
RUN apk add --no-cache --update bash
RUN apk add --no-cache --update curl
RUN curl -sSL https://sdk.cloud.google.com > /tmp/gcl && chmod +x /tmp/gcl && bash /tmp/gcl --install-dir=/tmp/gcloud --disable-prompts
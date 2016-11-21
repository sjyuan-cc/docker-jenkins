FROM jenkins
MAINTAINER  sjyuan  "sjyuan@thoughtworks.com"

RUN export LC_CTYPE=en_US.UTF-8 && export LC_ALL=en_US.UTF-8

USER root

RUN wget https://packages.chef.io/stable/debian/6/chefdk_0.9.0-1_amd64.deb \
    && dpkg -i chefdk_0.9.0-1_amd64.deb \
    && chef verify \
    && chef gem install knife-solo --version 0.4.3

# Install docker
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get purge lxc-docker \
    && apt-cache policy docker-engine \
    && apt-get update \
    && apt-get install -y docker-engine

# Install docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN apt-get -y install rsync

EXPOSE 8080







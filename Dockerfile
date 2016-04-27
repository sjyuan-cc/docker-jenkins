FROM jenkins
MAINTAINER  sjyuan  "sjyuan@thoughtworks.com"

RUN export LC_CTYPE=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8


USER root

# Install docker-jenkins
RUN apt-get update && \
apt-get install -y apt-transport-https ca-certificates && \
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list && \
apt-get update && \
apt-get purge lxc-docker && \
apt-cache policy docker-engine && \
apt-get update && \
apt-get install -y docker-engine


RUN usermod -aG docker jenkins

ADD  app/Dockerfile /app/


EXPOSE 8080







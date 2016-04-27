FROM ubuntu:14.04
MAINTAINER sjyuan <sjyuan.cc@gmail.com>
ENV REFRESHED_AT 2016-04-25

# ********Install basis********
RUN export LC_CTYPE=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
RUN apt-get install -y curl
RUN apt-get install -y git-core
RUN apt-get install -y wget


# ********Install jenkins********
RUN apt-get update -qq && apt-get install -qqy curl apt-transport-https
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates openjdk-7-jdk git-core docker-engine

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

ADD ./dockerjenkins.sh /usr/local/bin/dockerjenkins.sh
RUN chmod +x /usr/local/bin/dockerjenkins.sh

VOLUME /var/lib/docker

ADD  app/Dockerfile /app/


EXPOSE 8080 5000 80

ENTRYPOINT [ "/usr/local/bin/dockerjenkins.sh" ]

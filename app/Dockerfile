FROM ruby:2.1.5
MAINTAINER sjyuan <sjyuan.cc@gmail.com>
ENV REFRESHED_AT 2016-04-25

RUN export LC_CTYPE=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8

WORKDIR /app
RUN git clone https://thoughtworksXA:thoughtworks@bitbucket.org/primeroims/primero.git

RUN cd primero && \
bundle install

EXPOSE 8080 80 5000
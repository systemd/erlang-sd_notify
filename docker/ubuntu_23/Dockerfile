FROM ubuntu:18.04

RUN apt-get -y update

RUN  apt-get install -y  \
  make \
  git  \
  wget \
  build-essential \
  devscripts \
  fakeroot \
  debhelper \
  apt-transport-https

RUN wget -O - 'https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc' | apt-key add -  

RUN echo "deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang-23.x" > /etc/apt/sources.list.d/bintray.rabbitmq.list

RUN apt-get update -y 
RUN apt-get install erlang -y 

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3 && mv rebar3 /usr/local/bin/
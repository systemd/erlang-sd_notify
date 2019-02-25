FROM ubuntu:16.04

RUN apt-get -y update

RUN  apt-get install -y  \
  gcc \
  make \
  git  \
  wget \
  build-essential \
  devscripts \
  fakeroot \
  debhelper \
  libsystemd-dev


RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update -y
RUN apt-get install -y erlang-base=1:21.0-1 \
    erlang-syntax-tools=1:21.0-1 \
    erlang-examples=1:21.0-1 \
    erlang-src=1:21.0-1 \
    erlang-ic=1:21.0-1 \
    erlang-ic-java=1:21.0-1 \
    erlang-asn1=1:21.0-1 \
    erlang-crypto=1:21.0-1 \
    erlang-public-key=1:21.0-1 \
    erlang-ssl=1:21.0-1 \
    erlang-mnesia=1:21.0-1 \
    erlang-runtime-tools=1:21.0-1 \
    erlang-dev=1:21.0-1 \
    erlang-diameter=1:21.0-1 \
    erlang-eldap=1:21.0-1 \
    erlang-appmon=1:21.0-1 \
    erlang-common-test=1:21.0-1 \
    erlang-debugger=1:21.0-1 \
    erlang-dialyzer=1:21.0-1 \
    erlang-edoc=1:21.0-1 \
    erlang-erl-docgen=1:21.0-1 \
    erlang-et=1:21.0-1 \
    erlang-eunit=1:21.0-1 \
    erlang-gs=1:21.0-1 \
    erlang-inets=1:21.0-1 \
    erlang-inviso=1:21.0-1 \
    erlang-megaco=1:21.0-1 \
    erlang-observer=1:21.0-1 \
    erlang-odbc=1:21.0-1 \
    erlang-os-mon=1:21.0-1 \
    erlang-parsetools=1:21.0-1 \
    erlang-percept=1:21.0-1 \
    erlang-pman=1:21.0-1 \
    erlang-reltool=1:21.0-1 \
    erlang-snmp=1:21.0-1 \
    erlang-ssh=1:21.0-1 \
    erlang-test-server=1:21.0-1 \
    erlang-toolbar=1:21.0-1 \
    erlang-tools=1:21.0-1 \
    erlang-tv=1:21.0-1 \
    erlang-typer=1:21.0-1 \
    erlang-wx=1:21.0-1 \
    erlang-xmerl=1:21.0-1 \
    erlang=1:21.0-1 \
    erlang-ftp=1:21.0-1 \ 
    erlang-tftp=1:21.0-1  

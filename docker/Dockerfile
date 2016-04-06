FROM centos

RUN yum -y update 

RUN  yum install -y  \
  gcc \
  systemd-devel  \
  make \
  git  \
  wget \
  which



RUN mkdir /build && cd /build

RUN wget https://www.rabbitmq.com/releases/erlang/erlang-18.3-1.el7.centos.x86_64.rpm

RUN rpm -i erlang-18.3-1.el7.centos.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar



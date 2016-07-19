FROM centos

RUN yum -y update 

RUN  yum install -y  \
  gcc \
  systemd-devel  \
  make \
  git  \
  wget \
  which




RUN wget https://github.com/rabbitmq/erlang-rpm/releases/download/v1.4.0/erlang-19.0-1.el7.centos.x86_64.rpm

RUN rpm -i erlang-19.0-1.el7.centos.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar



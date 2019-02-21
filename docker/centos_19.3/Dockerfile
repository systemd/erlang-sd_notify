FROM centos

RUN yum -y update

RUN yum install -y  \
  gcc \
  systemd-devel  \
  make \
  git  \
  wget \
  which \
  epel-release \
  nano

RUN wget https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/19/el/7/x86_64/erlang-19.3.6.13-1.el7.centos.x86_64.rpm

RUN rpm -i erlang-19.3.6.13-1.el7.centos.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar

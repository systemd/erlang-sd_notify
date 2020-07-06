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

RUN yum install -y https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/22/el/7/x86_64/erlang-22.3.4.2-1.el7.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar

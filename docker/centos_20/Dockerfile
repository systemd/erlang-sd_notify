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
  nano \
  rpm-build

RUN yum install -y https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/20/el/7/x86_64/erlang-20.3.8.26-1.el7.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar



FROM centos

RUN yum -y update

RUN yum install -y  \
  make \
  git  \
  wget \
  which \
  epel-release \
  nano

RUN yum install -y https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/23/el/7/x86_64/erlang-23.0.2-1.el7.x86_64.rpm

RUN wget https://github.com/rebar/rebar/wiki/rebar && chmod +x rebar

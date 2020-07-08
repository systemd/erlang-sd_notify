FROM centos

RUN yum -y update

RUN yum install -y  \
  make \
  git  \
  wget \
  which \
  epel-release \
  nano

RUN yum install -y https://dl.bintray.com/rabbitmq-erlang/rpm/erlang/22/el/7/x86_64/erlang-22.3.4.2-1.el7.x86_64.rpm

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3 && mv rebar3 /usr/local/bin/

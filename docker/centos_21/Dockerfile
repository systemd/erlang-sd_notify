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




RUN wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm

RUN rpm -Uvh erlang-solutions-1.0-1.noarch.rpm

RUN yum update -y

RUN yum install -y erlang-erts-21.0-1.el7.centos \
  erlang-inets-21.0-1.el7.centos \
  erlang-kernel-21.0-1.el7.centos \
  erlang-mnesia-21.0-1.el7.centos \
  erlang-ssl-21.0-1.el7.centos \
  erlang-stdlib-21.0-1.el7.centos



RUN yum install -y  \
  erlang-21.0-1.el7.centos \
  rpm-build


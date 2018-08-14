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

RUN yum install -y erlang-erts-20.3-1.el7.centos \
  erlang-inets-20.3-1.el7.centos \
  erlang-kernel-20.3-1.el7.centos \
  erlang-mnesia-20.3-1.el7.centos \
  erlang-ssl-20.3-1.el7.centos \
  erlang-stdlib-20.3-1.el7.centos

RUN yumdownloader erlang-cosEvent-20.3-1.el7.centos \
  erlang-cosEventDomain-20.3-1.el7.centos \
  erlang-cosFileTransfer-20.3-1.el7.centos \
  erlang-cosNotification-20.3-1.el7.centos \
  erlang-cosProperty-20.3-1.el7.centos \
  erlang-cosTime-20.3-1.el7.centos \
  erlang-cosTransactions-20.3-1.el7.centos \
  erlang-orber-20.3-1.el7.centos

RUN rpm -Uvh erlang-orber-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosEvent-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosEventDomain-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosFileTransfer-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosNotification-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosProperty-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosTime-20.3-1.el7.centos.x86_64.rpm \
  erlang-cosTransactions-20.3-1.el7.centos.x86_64.rpm


RUN yum install -y  \
  erlang-20.3-1.el7.centos \
  rpm-build

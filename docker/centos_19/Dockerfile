FROM centos

RUN yum -y update 

RUN  yum install -y  \
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

RUN  yum update -y 

RUN  yum install -y  \
     erlang-19.1-1.el7.centos.x86_64 \
	 rebar \
  	 erlang-rebar \
  	 rpm-build

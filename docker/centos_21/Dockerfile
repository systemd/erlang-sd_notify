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




#RUN wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm

#RUN rpm -Uvh erlang-solutions-1.0-1.noarch.rpm

RUN echo $'[rabbitmq-erlang] \n\
name=rabbitmq-erlang \n\
baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/21/el/7 \n\
gpgcheck=1 \n\
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc \n\
repo_gpgcheck=0 \n\
enabled=1 \n\
' > /etc/yum.repos.d/rabbitmq-erlang.repo


RUN yum update -y

RUN yum install -y  \
  erlang-21.0.4-1.el7.centos.x86_64 \
  rpm-build

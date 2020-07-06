
Erlang systemd-notify
===============
Erlang module for native access to the `systemd-notify` facilities. 

Build status: [![Build Status](https://travis-ci.org/systemd/erlang-sd_notify.svg?branch=master)](https://travis-ci.org/systemd/erlang-sd_notify)


Installation
============

On Fedora/CentOS

```bash
    rpm -i erlang-sd_notify-{version}-1.el7.centos.x86_64.rpm
```

On Debian/Ubuntu

```bash
    dpkg -i erlang-sd-notify_{version}-1_amd64.deb
```

On openSUSE/SLES distributions

You can install the package using the openSUSE [repositories](https://build.opensuse.org/repositories/network:messaging:amqp/erlang-sd_notify)

For example for Leap15:
```bash
sudo zypper addrepo -f https://download.opensuse.org/repositories/network:/messaging:/amqp/openSUSE_Leap_15/network:messaging:amqp.repo
sudo zypper --gpg-auto-import-keys refresh
sudo zypper install erlang-sd_notify
```


Build from source using Docker
===

Ubuntu

```bash
    docker build -t build_ubuntu_{version} docker/ubuntu_{version}/
    docker run -v {sd_notify_dir}:/home/sd/ build_ubuntu_{version} /bin/sh -c "cd /home/sd/; make deb"
```

Centos

```bash
    docker build -t build_centos_{version} docker/centos_{version}/
    docker run -v {sd_notify_dir}:/home/sd/ build_centos_{version} /bin/sh -c "cd /home/sd/; make rpm"
```

Example

```bash
    docker build -t build_ubuntu_19 docker/ubuntu_19/
    docker run -v /home/gabriele/erlang-sd_notify:/home/sd/ build_ubuntu_19 /bin/sh -c "cd /home/sd/; make all"
```

Download Binaries
===
[Github Repository](https://github.com/systemd/erlang-sd_notify/releases)

Usage
=====

Quick example:

```bash
    [root@a499ee66251a]# erl
    ...
    1> sd_notify:sd_notify(0,"READY=1").
    0
```

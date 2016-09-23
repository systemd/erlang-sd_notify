
Erlang systemd-notify
===============
Erlang module for native access to the `systemd-notify` facilities. 

Build status: [![Build Status](https://travis-ci.org/systemd/erlang-sd_notify.svg?branch=master)](https://travis-ci.org/systemd/erlang-sd_notify)

Installation
============

On Fedora/CentOS
    
```bash
    extract the tar.gz
    mkdir -p /usr/lib64/erlang/lib/sd_notify-{version}/priv/
    mkdir -p /usr/lib64/erlang/lib/sd_notify-{version}/ebin/
    cp priv/* /usr/lib64/erlang/lib/sd_notify-{version}/priv/
    cp ebin/* /usr/lib64/erlang/lib/sd_notify-{version}/ebin/
```    

On Debian/Ubuntu

```bash
    dpkg -i erlang-sd-notify_{version}-1_amd64.deb
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
    docker run -v {sd_notify_dir}:/home/sd/ build_centos_{version} /bin/sh -c "cd /home/sd/; make all"
```

Example

```bash
    docker build -t build_centos docker/ubuntu_19/
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

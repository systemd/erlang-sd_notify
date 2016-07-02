
Erlang systemd-notify
===============
Erlang module for native access to the `systemd-notify` facilities. 

Build status: [![Build Status](https://travis-ci.org/systemd/erlang-sd_notify.svg?branch=master)](https://travis-ci.org/systemd/erlang-sd_notify)

Installation
============

On Fedora/CentOS
    
```bash
    extract the tar.gz
    mkdir -p /usr/lib64/erlang/lib/sd_notify-0.10/priv/
    mkdir -p /usr/lib64/erlang/lib/sd_notify-0.10/ebin/
    cp priv/* /usr/lib64/erlang/lib/sd_notify-0.10/priv/
    cp ebin/* /usr/lib64/erlang/lib/sd_notify-0.10/ebin/
```    

On Debian/Ubuntu

```bash
    dpkg -i erlang-sd-notify_0.10-1_amd64.deb
```
    
Build from source using Docker
===

On Ubuntu

```bash
    docker build -t build_ubuntu docker/ubuntu/
    docker run -v {sd_notify_dir}:/sd/ build_ubuntu /bin/sh -c "cd /sd/; make deb"
```

on Centos

```bash
    docker build -t build_centos docker/centos/
    docker run -v {sd_notify_dir}:/sd/ build_centos /bin/sh -c "cd /sd/; make all"
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


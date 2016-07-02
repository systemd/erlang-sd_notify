`sd_notify` Erlang interface for Centos 7 and Debian
---

This adds the `sd_notify` to the Centos erlang package.
Tested it starting for zero-dependencies RabbitMQ package ([github](https://github.com/rabbitmq/erlang-rpm) - [binany](https://www.rabbitmq.com/releases/erlang/) )

Build from source `RPM`
-

 1.  `docker build -t sd_rpm .`
 2. `make`
 

 
Download the binary
-
https://github.com/systemd/erlang-sd_notify/releases

Install and Test
-
Install:

        extract the tar.gz
        mkdir -p /usr/lib64/erlang/lib/sd_notify-0.10/priv/
        mkdir -p /usr/lib64/erlang/lib/sd_notify-0.10/ebin/
        cp priv/* /usr/lib64/erlang/lib/sd_notify-0.10/priv/
        cp ebin/* /usr/lib64/erlang/lib/sd_notify-0.10/ebin/
 

Test:

    [root@a499ee66251a]# erl
    ...    
    1> sd_notify:sd_notify(0,"READY=1").
    ok


Building on Debian
-
Install the pre-requisites to the build:

        sudo apt-get install build-essential devscripts fakeroot \
            debhelper erlang-dev libsystemd-dev erlang-eunit

Make the package:

        make deb

Install and test:

        sudo dpkg -i deb-build/erlang-sd-notify_0.9-1_amd64.deb
        erl
        1> sd_notify:sd_notify(0,"READY=1").
        ok

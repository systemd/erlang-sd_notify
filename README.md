`sd_notify` Erlang interface for Centos 7.
---

This add the `sd_notify` to the Centos erlang package.
I tested it starting for zero-dependencies RabbitMQ package ([github](https://github.com/rabbitmq/erlang-rpm) - [binany](https://www.rabbitmq.com/releases/erlang/) )

Build from source
-
To build it execute the docker image.
 
Download the binary
-
https://github.com/Gsantomaggio/erlang-sd_notify/releases/tag/0.9

Add to Erlang
-
I suppose you are using the [RabbitMQ Erlang installation].(https://www.rabbitmq.com/releases/erlang/)
Follow these steps:

	    extract the tar.gz
        mkdir -p /usr/lib64/erlang/lib/sd_notify-0.9/priv/
        mkdir -p /usr/lib64/erlang/lib/sd_notify-0.9/ebin/
        cp priv/* /usr/lib64/erlang/lib/sd_notify-0.9/priv/
        cp ebin/* /usr/lib64/erlang/lib/sd_notify-0.9/ebin/
 

Test
-
To test it use: `sd_notify:sd_notify(0,"READY=1")`, in this way:

    [root@a499ee66251a]# erl
    ...    
    1> sd_notify:sd_notify(0,"READY=1").
    ok

RabbitMQ notes:
-
RabbitMQ does not need `sd_notify`,.
This add the feature for the users that in general need `sd_notify`. 
The integration should be considerer as **experimental**  

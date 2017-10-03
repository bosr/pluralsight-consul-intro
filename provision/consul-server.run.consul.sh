#!/usr/bin/env bash

ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
nohup consul agent -dev -bind $ip > /dev/null 2>&1 &

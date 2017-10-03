#!/usr/bin/env bash

ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
nohup consul agent -advertise $ip -config-file /vagrant/common.json -config-file /vagrant/services/lb.service.json > /dev/null 2>&1 &


cp /vagrant/provision/haproxy.cfg /home/vagrant/
nohup consul-template -config /vagrant/provision/lb.consul-template.hcl > /dev/null 2>&1 &

/vagrant/provision/setup.lb.sh


sleep 5
consul kv put prod/
consul kv put prod/portal/
consul kv put prod/portal/haproxy/
consul kv put prod/portal/haproxy/maxconn 4096
consul kv put prod/portal/haproxy/timeout-connect 5s
consul kv put prod/portal/haproxy/timeout-client 50s
consul kv put prod/portal/haproxy/timeout-server 50s
consul kv put prod/portal/haproxy/stats enable
consul kv put prod/portal/haproxy/stats-uri /haproxy

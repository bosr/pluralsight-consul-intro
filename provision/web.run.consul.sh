#!/usr/bin/env bash

ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
nohup consul agent -advertise $ip -config-file /vagrant/common.json -config-file /vagrant/services/web.service.json > /dev/null 2>&1 &

/vagrant/provision/setup.web.sh

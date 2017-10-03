#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y unzip bc stress

CONSUL_VERSION=0.9.3

curl https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
# /usr/bin/consul agent -config-file /vagrant/desky.local.json

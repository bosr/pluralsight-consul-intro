#!/usr/bin/env bash

# Download consul-template
CONSUL_TEMPLATE_VERSION=0.19.3
URL=https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
curl $URL -o consul-template.zip

# Install consul-template
unzip consul-template.zip
chmod +x consul-template
sudo mv consul-template /usr/bin/consul-template

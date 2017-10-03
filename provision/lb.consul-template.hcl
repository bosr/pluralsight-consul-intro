template {
  source = "/vagrant/provision/haproxy.ctmpl"
  destination = "/home/vagrant/haproxy.cfg"
  command = "docker restart haproxy"
}

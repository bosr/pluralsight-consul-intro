Vagrant.configure("2") do |config|
  config.vm.box = "wesmcclure/ubuntu1404-docker"
  config.vm.provision "shell", path: "provision/install.consul.sh", privileged: false

  [
    {:name => "consul-server",  :ip => "172.20.20.31"},
  ].each do |node_def|
    config.vm.define node_def[:name] do |cs|
      cs.vm.hostname = node_def[:name]
      cs.vm.network "private_network", ip: node_def[:ip]

      cs.vm.provision "shell", privileged: false, run: "always",
        path: "provision/consul-server.run.consul.sh"

    end
  end

  [
    {:name => "lb",             :ip => "172.20.20.11"},
  ].each do |node_def|
    config.vm.define node_def[:name] do |cs|
      cs.vm.hostname = node_def[:name]
      cs.vm.network "private_network", ip: node_def[:ip]

      cs.vm.provision "shell", privileged: false,
        path: "provision/install.consul-template.sh"
      cs.vm.provision "shell",
        path: "provision/lb.run.consul.sh",
        privileged: false, run: "always"
    end
  end

  [
    {:name => "web1",           :ip => "172.20.20.21"},
    {:name => "web2",           :ip => "172.20.20.22"},
    {:name => "web3",           :ip => "172.20.20.23"},
  ].each do |node_def|
    config.vm.define node_def[:name] do |cs|
      cs.vm.hostname = node_def[:name]
      cs.vm.network "private_network", ip: node_def[:ip]

      cs.vm.provision "shell", privileged: false, run: "always",
        path: "provision/web.run.consul.sh"

    end
  end

end

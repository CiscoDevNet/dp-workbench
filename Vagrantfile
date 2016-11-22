# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "iosxe"

    config.vm.define "rtr1" do |node|
      node.vm.network "private_network", 
        ip: "172.20.20.10",
        auto_config: false
      node.vm.network "private_network", 
        virtualbox__intnet: "link1", 
        auto_config: false

      # attach a configuration disk
      node.vm.provider "virtualbox" do |v|
        v.customize ["storageattach", :id, 
          "--storagectl", "IDE_Controller", 
          "--port", 1, 
          "--device", 0, 
          "--type", "dvddrive", 
          "--medium", "rtr1.iso"
        ]
        #v.customize ["modifyvm", :id, 
        #  "--uart1", "0x3F8", 4, 
        #  "--uartmode1", 'tcpserver', 65000
        #]
      end
    end

    config.vm.define "rtr2" do |node|
      node.vm.network "private_network", 
        ip: "172.20.20.20",
        auto_config: false
      node.vm.network "private_network", 
        virtualbox__intnet: "link1", 
        auto_config: false

      # attach a configuration disk
      node.vm.provider "virtualbox" do |v|
        v.customize ["storageattach", :id, 
          "--storagectl", "IDE_Controller", 
          "--port", 1, 
          "--device", 0, 
          "--type", "dvddrive", 
          "--medium", "rtr2.iso"
        ]
        #v.customize ["modifyvm", :id, 
        #  "--uart1", "0x3F8", 4, 
        #  "--uartmode1", 'tcpserver', 65001
        #]
      end
    end
end

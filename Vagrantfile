# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = 'aeons/rails'
  config.vm.box_check_update = false
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.synced_folder '.', '/home/vagrant/tlmld', type: 'rsync', rsync__exclude: '.git/'

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 4
    vb.memory = 8192
  end
end

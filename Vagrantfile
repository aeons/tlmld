# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.synced_folder '.', '/home/vagrant/code', type: 'smb'

  config.vm.provider :virtualbox do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt'
    chef.add_recipe 'postgresql::client'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::ruby'
    chef.add_recipe 'postgresql::config_initdb'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'heroku-toolbelt'

    chef.json = {
        rbenv: {
            user_installs: [{
                                user: 'vagrant',
                                rubies: ['2.2.2'],
                                global: '2.2.2',
                                gems: {
                                    '2.2.2' => [
                                        {name: 'bundler'}
                                    ]
                                }
                            }]
        },
        postgresql: {
            password: {
                postgres: 'password'
            },
            pg_hba: [{type: 'local', db: 'postgres', user: 'postgres', addr: nil, method: 'trust'}]
        }
    }
  end
end

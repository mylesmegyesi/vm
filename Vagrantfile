# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'development-vm'

  config.vm.forward_port 8080, 8080
  config.vm.forward_port 8081, 8081
  config.vm.forward_port 4000, 4000

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe('helper::setup')

    # Dev Tools
    chef.add_recipe('git')
    chef.add_recipe('zsh')
    chef.add_recipe('vim')
    chef.add_recipe('tmux')
    chef.add_recipe('ack')

    # Languages
    chef.add_recipe('ruby')
    chef.add_recipe('java')
    chef.add_recipe('clojure')
    chef.add_recipe('node')
    chef.add_recipe('coffee_script')
    chef.add_recipe('go')
    chef.add_recipe('haskell')

    # Datastores
    chef.add_recipe('redis')
    chef.add_recipe('riak')
    chef.add_recipe('mongodb')
    chef.add_recipe('postgres')
    chef.add_recipe('mysql')
    chef.add_recipe('sqlite')
    chef.add_recipe('rabbitmq')

    # Search Engines
    chef.add_recipe('elasticsearch')

    # Headless browsers
    chef.add_recipe('xvfb')
    chef.add_recipe('phantomjs')

    chef.add_recipe('helper::cleanup')
  end
end

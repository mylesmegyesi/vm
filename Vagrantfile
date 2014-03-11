Vagrant.configure('2') do |config|

  config.vm.define('dev-vm') do |dev_vm|

    dev_vm.vm.network 'forwarded_port', guest: 8080, host: 8080
    dev_vm.vm.network 'forwarded_port', guest: 3000, host: 3000
    dev_vm.vm.network 'forwarded_port', guest: 8081, host: 8081
    dev_vm.vm.network 'forwarded_port', guest: 22,   host: 2223
    dev_vm.vm.synced_folder ".", "/vagrant", disabled: true

    dev_vm.ssh.forward_agent = true
    dev_vm.ssh.keep_alive    = true
    dev_vm.ssh.username      = 'mylesmegyesi'

    dev_vm.vm.provider 'vmware_fusion' do |v, override|
      override.vm.box   = 'ubuntu-13.10.amd64.vmware'
      v.vmx['memsize']  = '8192'
      v.vmx['numvcpus'] = '4'
      v.name            = 'dev-vm'
    end

    dev_vm.librarian_chef.cheffile_dir = '.'
    dev_vm.vm.provision :chef_solo do |chef|

      chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
      chef.roles_path     = 'roles'
      chef.add_role('dev_vm')

    end

  end

end

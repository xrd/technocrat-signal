Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision :shell, path: 'bootstrap.sh'

#   config.vm.provision "ansible" do |ansible|
#     ansible.verbose = "v"
#     ansible.playbook = "playbook.yml"
#   end

end

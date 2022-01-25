Vagrant.configure("2") do |config|
  config.vm.define "master" do |subconfig|
    subconfig.vm.box = "hashicorp/bionic64"
    subconfig.vm.hostname = "master"
    subconfig.vm.provider "virtualbox"
    subconfig.vm.network "public_network", bridge: "BRIDGE"

    subconfig.vm.provision "ansible_local" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "provisioning/master_playbook.yaml"
    end
  end
end

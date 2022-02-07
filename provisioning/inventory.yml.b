# Ansible master server
[master]
192.168.56.2

# App servers
[apps]
192.168.56.3
192.168.56.4

# All servers
[multi:children]
master
apps

# Variables applied to all servers
[multi:vars]
ansible_user=vagrant
private_key_file=~/.vagrant.d/insecure_private_key

# -*- mode: ruby -*-
# vi: set ft=ruby :
# Practice boxes
# Good commands to know:
# vagrant status
# vagrant destroy nameofbox


Vagrant.configure("2") do |config|

  # Set std box to use, and configure their std stats
  config.vm.box = "hashicorp/bionic64"
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 1
    v.linked_clone = true #shared resources between boxes
  end

  # //Various settings\\
  # Use insecure key, since only testing environment
  config.ssh.insert_key = "false"
  # Turn off synced folder to isolate machines
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Master ansible server box
  config.vm.define "master" do |master|
    master.vm.box = "hashicorp/bionic64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.2"
  end

  # AppBox1
  config.vm.define "appbox1" do |appbox1|
    appbox1.vm.hostname = "appbox1.test"
    appbox1.vm.network :private_network, ip: "192.168.56.3"
  end

  # AppBox1
  config.vm.define "appbox2" do |appbox2|
    appbox2.vm.hostname = "appbox2.test"
    appbox2.vm.network :private_network, ip: "192.168.56.4"
  end






end

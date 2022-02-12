# This is a script for RHEL(Rocky 8) - Kernel: 4.18.0-348.el8.0.2.x86_64
# Install and configure Vagrant and Ansible so that they are ready for general usage
# Preparation stages prior to running this script:
# 0. Make sure that virtualization is enabled via BIOS
# 1. Create a directory in which you would like to setup Vagrant files etc
# 2. Change to this directory

# Installation of Vagrant
# https://www.vagrantup.com/docs/index
sudo yum install epel-release -y
sudo yum install yum-utils -y
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo -y
sudo yum install vagrant -y

# Installation of VirtualBox
sudo dnf install gcc make perl kernel-devel kernel-headers bzip2 dkms -y
sudo dnf update kernel-*
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo dnf update	
sudo dnf install VirtualBox-6.1 -y
# Might need to install kernelmodule for virtualbox
sudo dnf install akmod-VirtualBox kernel-devel-4.18.0-348.2.1.el8_5.x86_64 -y
sudo akmods --kernels 4.18.0-348.2.1.el8_5.x86_64 -y
sudo systemctl restart vboxdrv.service
# List of Vagrant boxes: https://app.vagrantup.com/boxes/search

# Installation of Ansible
# https://docs.ansible.com/
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora
sudo yum install ansible

# Initialize Vagrant and start the box
vagrant init hashicorp/bionic64
vagrant up
# Enter the box with $ vagrant ssh


# Additional relevant sources:
# how to use Vagrant and Ansible together: https://docs.ansible.com/ansible/2.4/guide_vagrant.html
# tutorial: https://www.middlewareinventory.com/blog/vagrant-ansible-example/

# This is a script for RHEL(CentOS 8) - Kernel: 4.18.0-348.2.1.el8_5.x86_64
# Install and configure Vagrant and Ansible so that they are ready for general usage
# Preparation stages prior to running this script:
# 0. Make sure that virtualization is enabled via BIOS
# 1. Create a directory in which you would like to setup Vagrant files etc
# 2. Change to this directory

# Installation of Vagrant
# https://www.vagrantup.com/docs/index
sudo yum install vagrant
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install vagrant -y
# Might need to install kernelmodule for virtualbox
sudo dnf install akmod-VirtualBox kernel-devel-4.18.0-348.2.1.el8_5.x86_64
sudo akmods --kernels 4.18.0-348.2.1.el8_5.x86_64 
sudo systemctl restart vboxdrv.service
#Initialize Vagrantfile
vagrant init

# Installation of VirtualBox
sudo yum install VirtualBox

# Installation of Ansible
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora
sudo yum install epel-release
sudo yum install ansible

# Start the Vagrant box
vagrant up

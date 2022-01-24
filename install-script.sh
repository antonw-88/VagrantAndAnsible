# This is a script for RHEL(CentOS 8) - to install and configure Vagrant and Ansible so that they are ready for general usage
# Preparation stages prior to running this script:
# 0. Make sure that virtualization is enabled via BIOS
# 1. Create a directory in which you would like to setup Vagrant files etc
# 2. Change to this directory

# Installantion of Vagrant
sudo yum install vagrant
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install vagrant -y
vagrant init
#Change in Vagrantfile: 
sed -i 's/config.vm.box = "base"/config.vm.box = "hashicorp\/bionic64"/' Vagrantfile

# Might need to install 
sudo dnf install akmod-VirtualBox kernel-devel-4.18.0-348.2.1.el8_5.x86_64
sudo akmods --kernels 4.18.0-348.2.1.el8_5.x86_64 
sudo systemctl restart vboxdrv.service

# Installation of VirtualBox
sudo yum install VirtualBox

# Start the Vagrant box Vagrant
vagrant up

# Installation of Ansible

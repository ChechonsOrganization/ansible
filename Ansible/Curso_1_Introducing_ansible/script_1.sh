ssh-keygen # si ya tenemos ssh-key saltar
ssh-copy-id sergiowsl@localhost
# si falla el ssh-copy-id
sudo apt list --installed | grep openssh-server
sudo service ssh status
sudo service ssh start
sudo service ssh restart
# fin
clear

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible --version

vim /etc/ansible/hosts
# inside
127.0.0.1
# end

ansible all -m ping
ansible all --list-hosts
# if we have a groups
ansible webservers --list-hosts


# modules
ansible-doc -l | wc -l
ansible-doc -l
ansible-doc docker_swarm
ansible doc -l | grep aws


# example 1 
# command idemponent, it mean that runs once, not multiple times

# firewalld doesnt work on python3 for some reason
ansible all -m firewalld -a "service=https permanent=yes state=enabled" -b
ansible all -m firewalld -a "port=8081/tcp permanent=yes state=enabled" -b --ask-become-pass
ansible all -m service -a "name=firewalld state=started" -b --ask-become-pass


# Running the deploying nginx
ansible-playbook nginx.yml


ansible all -m setup



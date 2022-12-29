# ansible ad-hoc
ansible -i inv remote -m setup -a filter='*ipv4*'
vim /etc/ansible/ansible.cfg
ansible -i inv all -m setup
ansible-playbook -i inv facts.yml
ip addr show
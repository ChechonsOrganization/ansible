# Your CIO has greenlit a proof of concept for Ansible in your environment. 
# You are to set up an Ansible control node in a test environment and verify basic functionality. 
# You have three demo hosts, one to be the control node (control1), and two to serve as managed nodes (node1 and node2).
# You must complete the following steps:

# Install Ansible on the control node.
# Configure the ansible user on the control node for ssh shared key access to managed nodes.
# Note: do not use a passphrase for the key pair.
# Create a simple Ansible inventory on the control node in /home/ansible/inventory containing node1 and node2.
# Configure sudo access for Ansible on node1 and node2 so that Ansible may use sudo for any command with no password prompt.
# Verify each managed node can be accessed by Ansible from the control node using the ping module. Redirect the output of a successful command to /home/ansible/output.
# Important Notes:

# The user ansible is already present on all servers for your convenience.
# The ansible user has the same password as the cloud_user.
# /etc/hosts entries are present on control1 for the managed nodes.

# 1
ssh cloud_user@54.83.185.103 # pass: J0oL+iij

# 2
sudo yum install ansible -y

# 3
sudo su - ansible
ssh-keygen
ssh-copy-id node1
ssh-copy-id node2

# 4
sudo su - ansible # if not already ansible user (cloud_user)
touch /home/ansible/inventory
echo "node1" >> /home/ansible/inventory
echo "node2" >> /home/ansible/inventory

# 5
ssh cloud_user@node1
sudo visudo
# ansible    ALL=(ALL)       NOPASSWD: ALL

ssh cloud_user@node2
sudo visudo
# ansible    ALL=(ALL)       NOPASSWD: ALL


# 6
sudo su - ansible # pass: J0oL+iij
ansible -i /home/ansible/inventory node1 -m ping
ansible -i /home/ansible/inventory node2 -m ping
ansible -i inventory node1 -m ping > output
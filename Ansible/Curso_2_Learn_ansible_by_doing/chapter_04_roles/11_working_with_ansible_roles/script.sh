# You have just started a new job as the operations lead at a small company. There is currently no formal server baseline, 
# and it makes for a mixed configuration environment that is consuming more support and maintenance than it should. 
# You have decided to create a baseline process using Ansible by creating a baseline role. 
# You have noted the following commonalities that should be included in the baseline role:

# Set /etc/motd based on a template.
# Install the latest Nagios client.
# Add the Nagios server to /etc/hosts.
# Create a noc user.
# Import the noc user's public key (copy authorized keys to /home/noc/.ssh/authorized_keys).
# The role should be called "baseline" and should reside in /etc/ansible/roles on the ansible control node.

# You will test your role on some newly requested webservers. A playbook called web.yml has been provided for you and deploys
# httpd to all servers in the web group (defined in your default inventory). 
# You will need to edit the playbook to deploy the baseline role to the servers in the web group as well.

# You will find the motd template, Nagios server IP information, the noc user's public key, and the web.yml playbook in /home/ansible/resources on the ansible control node.

# Summary tasks list:

# Create the necessary directories and files for the baseline role.
# Configure the role to deploy the /etc/motd template.
# Configure the role to install the latest Nagios client.
# Configure the role to add an entry to /etc/hosts for the Nagios server.
# Configure the role to create the noc user and deploy the provided public key for the noc user on target systems (copy authorized_keys to /home/noc/.ssh/authorized_keys with the owner and group owner set as noc and the mode as 0600).
# Edit web.yml to deploy the baseline role in addition to what it already does.
# Verify that your role works by deploying web.yml wth Ansible.
# Important notes:

# For your convenience, Ansible is already installed on the control node.
# The user ansible is on all servers with the appropriate shared keys for access to necessary servers from the control node.
# The ansible user has sudo access with no password. It uses the same password as cloud_user.
# All the necessary Ansible inventories have been created for you.


sudo su - ansible

cd /etc/ansible/roles
ll
sudo mkdir baseline && sudo chown ansible.ansible baseline
mkdir /etc/ansible/roles/baseline/{templates,tasks,files}

echo "---" > baseline/tasks/main.yml

cp /home/ansible/resources/motd.j2 /etc/ansible/roles/baseline/templates
vim /etc/ansible/roles/baseline/tasks/deploy_motd.yml
vim baseline/tasks/main.yml
cat /home/ansible/resources/file.txt
vim baseline/tasks/deploy_nagios.yml
vim baseline/tasks/main.yml
vim baseline/tasks/edit_hosts.yml
vim baseline/tasks/main.yml
cp /home/ansible/resources/authorized_keys /etc/ansible/roles/baseline/files/
vim baseline/tasks/deploy_noc_user.yml
vim baseline/tasks/main.yml
vim /home/ansible/resources/web.yml
ansible-playbook /home/ansible/resources/web.yml



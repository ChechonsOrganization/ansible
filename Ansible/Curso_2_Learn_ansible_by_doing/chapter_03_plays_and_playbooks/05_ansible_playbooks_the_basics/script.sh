# Your company has been increasing the deployment of small broacher-style websites for clients. The head of IT has decided that each client should have their own web servers for better client isolation and has tasked you with creating concept automation to quickly deploy web-nodes with simple static website content.

# You have been provided an ansible control node and 2 test lab servers (node1 and node2) that have been preconfigured with the ansible user and key.

# You must create an ansible inventory in /home/ansible/inventory containing a host group named web. The web group should contain node1 and node2.

# Furthermore, you must design an Ansible playbook that will execute the following tasks on your configured inventory: install httpd, start and enable the httpd service, and install a simple website provided on a repo server. Create the playbook in /home/ansible/web.yml. The simple website may be accessed from http://repo.example.com/website.tgz.

# Note: Please wait an extra minute before starting the lab to make sure it is fully provisioned.

# Summary tasks list:

# Create an inventory in /home/ansible/inventory containing a host group named web. The web group should contain node1 and node2.
# Create a playbook in /home/ansible/web.yml.
# Configure the playbook to install httpd on the web group.
# Configure the playbook to start and enable the httpd service on the web group.
# Configure the playbook to retrieve the website from http://repo.example.com/website.tgz on each server in the web group.
# Configure the playbook to unarchive the website into /var/www/html on all servers in the web group.
# Execute the playbook you created using the inventory you created to verify your work.
# Important notes:

# For your convenience, Ansible has been installed on the control node.
# The user ansible is present on all servers with appropriate shared keys for access to managed servers from the control node.
# The ansible user has the same password as cloud_user.
# /etc/hosts entries have been made on control1 for the managed servers.


# Control Host - Connect as ansible user
sudo su - ansible
cat /etc/ansible/hosts
vim /home/ansible/inventory
vim /home/ansible/web.yml

# i = inventory location 
ansible-playbook -i inventory web.yml
curl node1/home.html

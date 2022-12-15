# We have to set up automation to pull down a data file, from a notoriously unreliable third-party system, for integration purposes. Create a playbook that attempts to pull down http://apps.l33t.com/transaction_list to localhost. The playbook should gracefully handle the site being down by outputting the message "l33t.com appears to be down. Try again later." to stdout. If the task succeeds, the playbook should write "File downloaded." to stdout. No matter if the playbook errors or not, it should always output "Attempt completed." to stdout.

# If the report is collected, the playbook should write and edit the file to replace all occurrences of #BLANKLINE with a line break \n.

# Tasks list summary:

# Create a playbook, /home/ansible/report.yml.
# Configure the playbook to download http://apps.l33t.com/transaction_list to /home/ansible/transaction_list on localhost and output "File downloaded." to stdout.
# Configure the playbook to handle connection failure by outputting "l33t.com appears to be down. Try again later." to stdout.
# Configure the playbook to output "Attempt Completed" to stdout, whether it was successful or not.
# Configure the playbook to replace all instances of #BLANKLINE with the line break character \n.
# Run the playbook using the default inventory to verify whether things work or not.
# Important notes:

# For convenience, Ansible has been installed on the control node.
# The user ansible already exists on all servers, with appropriate shared keys for access to the necessary servers from the control node.
# The ansible user has the same password as cloud_user.
# All necessary Ansible inventories have already been created.
# apps.l337.com is unavailable by default.
# We may force a state change by running /home/ansible/scripts/change_l33t.sh.

sudo su - ansible
vim /home/ansible/report.yml
ansible-playbook report.yml
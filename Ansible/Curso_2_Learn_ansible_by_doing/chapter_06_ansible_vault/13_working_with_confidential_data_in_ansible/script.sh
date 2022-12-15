# In an effort to improve security, you have been tasked with securing an Ansible variable file. 
# The variable file is to be used in an ansible job that creates a secure website. To do this, complete the following:

# Encrypt the file /home/ansible/secret using ansible-vault.
# Then configure a vault password file named /home/ansible/vault to be used to run the Ansible playbook /home/ansible/secPage.yml successfully with the encrypted secrets file.
# Verify your work by running the secPage.yml playbook using ansible-playbook and specifying your vault password file.
# Test that the site deployed correctly by trying to access http://node1/secure/classified.html using the user bond with the password james.
# Summary tasks list:

# Encrypt home/ansible/secret using the ansible-vault command.
# Create /home/ansible/vault as a vault password file that may be used to access the encrypted secret file without prompt.
# Run the playbook /home/ansible/secPage.yml using your vault password file to validate your work.
# Verify that the secure page deployed correctly by attempting to access http://node1/secure/classified.html as the user bond with the password james.
# Important notes:

# For your convenience, Ansible has been installed on the control node.
# /home/ansible/secPage.yml provides several examples of how to use various key ansible modules. It is worth looking at, but it should not require modification.
# The user ansible is already on all servers with the appropriate shared keys for access to all necessary servers from the control node.
# The ansible user also has sudo access with no password. It has the same password as cloud_user.
# All necessary Ansible inventories have been created for you.

su ansible

ansible-vault encrypt secret # hola
vim vault # hola
ansible-vault view secret
ansible-playbook --vault-password-file vault secPage.yml
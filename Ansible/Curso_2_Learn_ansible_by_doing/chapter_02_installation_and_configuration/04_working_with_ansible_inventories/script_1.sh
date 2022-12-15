# Your company decided that their backup software license was frivolous and unnecessary. Because of this, the license was not renewed. 
# As a stop-gap measure, your supervisor has created a simple script and an Ansible playbook to create an archive of select files, depending on pre-defined Ansible host groups.
#  You will create the inventory file to complete the backup strategy.

# Important notes:
# For your convenience, Ansible has been installed on the control node.
# The user ansible has already been created on all servers with appropriate shared keys for access to managed servers from the control node.
# The ansible user has the same password as cloud_user.
# /etc/hosts entries have been made on control1 for the managed servers.

# 1 Create the inventory File in /home/ansible/
ssh cloud_user@35.173.49.157 # 7O!E(Om3
sudo su - ansible
touch inventory

# 2 Configure the media Host Group to Contain media1 and media2
vim inventory

# [media]
# media1
# media2


# 3 Define Variables for media with Their Accompanying Values
mkdir group_vars
cd group_vars
touch media
vim media
media_content: /var/media/content/
media_index: /opt/media/mediaIndex

# 4 Configure the webservers Host Group to Contain the Hosts web1 and web2
cd ..
vim inventory
# add [webservers]
# web1
# web2

# 5 Define Variables for webservers with Their Accompanying Values
cd group_vars
vim webservers
# httpd_webroot: /var/www/
# httpd_config: /etc/httpd/

# 6 Define the script_files Variable for web1 and Set Its Value to /usr/local/scripts
mkdir host_vars
vim web1
# script_files: /usr/local/scripts
./scripts/backup.sh


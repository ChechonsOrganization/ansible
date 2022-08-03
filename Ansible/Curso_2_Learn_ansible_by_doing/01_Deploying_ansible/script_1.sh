# Preview Step
ssh cloud_user@external_ip # pass: okl5&u2I

# 1 install ansible on the control host (CENTOS 7)
sudo yum install epel-release -y
sudo yum install ansible -y

#  2 add ansible on both the control host and workstation host being sure to set a password you can remember
# password: sergio.2022
sudo useradd ansible
sudo passwd ansible # only in workstation

# 3 Configure a pre-shared key for ansible that allows the user to log in from control to workstation without a password
sudo -i -u ansible # (provide cloud_user a sudo password)
ssh-keygen #accept default options by pressing enter
ssh-copy-id workstation # (provide ansible user a password)
logout


# 4 Configure the Ansible user on the workstation host so that ansible may sudo without a password
# login in host as cloud_user and run the cmd:
sudo visudo
# and add the text at the end of the file that is opened:
# ansible ALL=(ALL) NOPASSWD: ALL
# and save file with :wq in vim

# 5 Create a simple inventory in /home/ansible/inventory consisting of only the workstation host
# on the control host as the ansible user run the following cmds
sudo -i -u ansible
pwd
vim /home/ansible/inventory
# add the text "workstation" and save the file


# 6 Write an Ansible playbook in /home/ansible/git-setup.yml on the control node that install git on workstation
# then execute the playbook

# on the control host as the ansible user run the following cmds
vim /home/ansible/git-setup.yml
# add the lines and save
--- # install git on target host
    - hosts: workstation
      become: yes
      tasks:
      - name: install git
        yum:
          name: git
          state: latest

# then run ansible-playbook -i /home/ansible/inventory /home/ansible/git-setup.yml

# verify the git installation on workstation
ssh workstation
which git
        
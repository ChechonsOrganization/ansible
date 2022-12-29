# call a ansible-playbook containing a reference file host or group
ansible-playbook vars_play.yml -e @vars.yml # -e @vars.yml to treat vars.yml as a variable file for our playbook
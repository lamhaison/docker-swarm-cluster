# Install consul on three nodes
ansible-playbook -s -i /etc/ansible/production consul-ansible.yml

# Init bootstrap consul
ansible-playbook -s -i /etc/ansible/production consul-ansible.yml --tags "consul" --limit "prod-consul-1" --extra-vars "init_consul=true"

ansible-playbook -s -i /etc/ansible/production consul-ansible.yml --tags "consul" --limit "prod-consul-2" --extra-vars "join_consul=true"
ansible-playbook -s -i /etc/ansible/production consul-ansible.yml --tags "consul" --limit "prod-consul-3" --extra-vars "join_consul=true"

# ansible-playbook -s -i /etc/ansible/production consul-ansible.yml --tags "consul" --limit "prod-consul-1" --extra-vars "join_consul=true"



# Install HAproxy
ansible-playbook -s -i /etc/ansible/production node-ansible.yml --limit=prod-consul --tags "installhaproxy" --extra-vars "install_haproxy=true" 

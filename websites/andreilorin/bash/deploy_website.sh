#!/bin/bash
DO_TOKEN=$1
SSH_FINGERPRINT=$2

terraform init ~/DevOps/terraform-do/

terraform plan \
                -var "do_token=${DO_TOKEN}" \
                -var "ssh_fingerprint=${SSH_FINGERPRINT}" \
                -var "pub_key=$HOME/.ssh/id_rsa.pub" \
                -var "pvt_key=$HOME/.ssh/id_rsa" \
                ~/DevOps/terraform-do/

terraform apply \
                -auto-approve \
                -var "do_token=${DO_TOKEN}" \
                -var "ssh_fingerprint=$SSH_FINGERPRINT" \
                -var "pub_key=$HOME/.ssh/id_rsa.pub" \
                -var "pvt_key=$HOME/.ssh/id_rsa" \
                ~/DevOps/terraform-do/

terraform output public_ip >> /etc/ansible/hosts

ansible-playbook ~/DevOps/ansible/andreilorin.yaml
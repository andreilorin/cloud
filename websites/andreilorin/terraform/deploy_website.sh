#!/usr/bin/bash

terraform init

terraform plan \
                -var "do_token=${DO_TOKEN}" \
                -var "domain_name=biancabirsan.com" \
                -var "key_name=RyzenWSL2KEY" \
                -var "pub_key=$HOME/.ssh/id_rsa.pub" \
                -out "./serverplan"

terraform apply \
                -auto-approve \
                -var "do_token=${DO_TOKEN}" \
                -var "domain_name=biancabirsan.com" \
                -var "key_name=RyzenWSL2KEY" \
                -var "pub_key=$HOME/.ssh/id_rsa.pub" \

sudo terraform output public_ip >> /etc/ansible/hosts

terraform output public_ip
ansible-playbook ../ansible/andreilorin.yaml
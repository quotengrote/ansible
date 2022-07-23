# ansible_heimserver

[![Build Status](http://docker9.grote.lan/api/badges/mg/ansible/status.svg)](http://docker9.grote.lan/mg/ansible)

## example-cli
`ansible-playbook playbooks/base/0_master.yml  -i inventory --key-file id_rsa_ansible_user --vault-password-file vault-pass.yml --limit jenkins-test.grote.lan`

# ansible_heimserver

[![pipeline status](http://git.mgrote.net/mg/ansible/badges/master/pipeline.svg)](http://git.mgrote.net/mg/ansible/-/commits/master)

## example-cli
`ansible-playbook playbooks/base/0_master.yml  -i inventory --key-file id_rsa_ansible_user --vault-password-file vault-pass.yml --limit jenkins-test.grote.lan`

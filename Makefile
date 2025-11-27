CLUSTER ?= atlantis

.PHONY: atlantis central gotham madripoor metropolis wakanda


atlantis:
	ansible-playbook -e cluster=atlantis playbooks/deploy-opencodequest-workshop.yaml

central:
	ansible-playbook -e cluster=central playbooks/deploy-opencodequest-workshop.yaml

gotham:
	ansible-playbook -e cluster=gotham playbooks/deploy-opencodequest-workshop.yaml

madripoor:
	ansible-playbook -e cluster=madripoor playbooks/deploy-opencodequest-workshop.yaml

metropolis:
	ansible-playbook -e cluster=metropolis playbooks/deploy-opencodequest-workshop.yaml

wakanda:
	ansible-playbook -e cluster=wakanda playbooks/deploy-opencodequest-workshop.yaml



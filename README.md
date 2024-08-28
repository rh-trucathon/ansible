# Ansible Playbooks

## Quay Configuration

Install the pre-requisites.

```sh
ansible-galaxy collection install -r collections/requirements.yml
```

Generate an admin token in Quay.

1. Log in to the Quay Container Registry web UI.
2. Use an existing organization or create a new one.
3. In the organization, create an application.
4. In the application, select the `Generate Token` menu.
5. Select the permissions to associate to the token.
   To be able to use all the modules in the collection, select `Administer Organization`, `Administer Repositories`, `Create Repositories`, `Super User Access`, and `Administer User`.
6. Click `Generate Token`.

Create a vault and store the `quay_host` and `quay_token`.

```sh
export ANSIBLE_VAULT_IDENTITY_LIST="itix@~/local/bin/ansible-vault-password"
ansible-vault create vaults/cluster-9hbm4.yaml
```

Run the playbook.

```sh
ansible-playbook -i /dev/null -e @vaults/cluster-9hbm4.yaml quay-config.yaml
```

# ocp4_workload_opencodequest_workshop

An Ansible role to create ArgoCD applications that deploy Helm charts and YAML manifests from a GitOps repository.

## Description

This role creates ArgoCD Application resources that deploy:
- Helm charts for configuration jobs (ACS, DevSpaces, GitLab, Keycloak, RHDH)
- Helm charts for EDB operator and workshop

The role supports both cluster-specific and non-cluster-specific applications for a single cluster.

## Requirements

- Ansible 2.9+
- `kubernetes.core` collection installed
- Access to a Kubernetes/OpenShift cluster with ArgoCD installed
- Proper RBAC permissions to create ArgoCD Applications

## Role Variables

### Required Variables

None - all variables have defaults.

### Optional Variables

See `defaults/main.yaml` for all available variables. Key variables:

- `gitops_repo.url`: GitHub repository URL (default: `https://github.com/rh-opencodequest/helm.git`)
- `gitops_repo.branch`: Branch to use (default: `main`)
- `cluster`: Cluster name to deploy to (default: `atlantis`)
- `enable_*`: Boolean flags to enable/disable each component (all default to `true`)

## Dependencies

- `kubernetes.core` collection

## Example Playbook

### Deploy to a cluster

```yaml
- hosts: localhost
  gather_facts: false
  roles:
    - role: ocp4_workload_opencodequest_workshop
      vars:
        cluster: atlantis
        gitops_repo:
          url: "https://github.com/rh-opencodequest/helm.git"
          branch: "main"
```

### Deploy only specific components

```yaml
- hosts: localhost
  gather_facts: false
  roles:
    - role: ocp4_workload_opencodequest_workshop
      vars:
        cluster: atlantis
        enable_edb: false
        enable_rhdh: true
        enable_gitlab: true
```

## License

See LICENSE file if present.

## Author Information

This role was created for the OpenCodeQuest workshop.


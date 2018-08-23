# Zsh Plugin: Kubeadm

Add tab completion for
[kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins kubeadm
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: kubeadm
          url: gantsign/zsh-plugins
          location: kubeadm
```

Note: replace `example_username` with the username to install this plugin for.

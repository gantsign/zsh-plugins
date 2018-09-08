# Zsh Plugin: Kompose

Add tab completion for [Kompose](http://kompose.io).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins kompose
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: kompose
          url: gantsign/zsh-plugins
          location: kompose
```

Note: replace `example_username` with the username to install this plugin for.

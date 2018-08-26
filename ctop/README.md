# Zsh Plugin: ctop

Add tab completion for [ctop](https://github.com/bcicen/ctop).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins ctop
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: ctop
          url: gantsign/zsh-plugins
          location: ctop
```

Note: replace `example_username` with the username to install this plugin for.

# Zsh Plugin: bat

Add tab-completion for [bat](https://github.com/sharkdp/bat).

Note: doesn't include tab-completion for the `cache` sub-command.

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins bat
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: bat
          url: gantsign/zsh-plugins
          location: bat
```

Note: replace `example_username` with the username to install this plugin for.

# Zsh Plugin: Pipenv

Add tab completion for
[Pipenv]https://github.com/pypa/pipenv).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins pipenv
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: pipenv
          url: gantsign/zsh-plugins
          location: pipenv
```

Note: replace `example_username` with the username to install this plugin for.

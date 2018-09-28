# Zsh Plugin: fd

Add aliases for [fd](https://github.com/sharkdp/fd).

Note: also removes conflicting Oh My Zsh alias for `find`.

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins fd
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: fd
          url: gantsign/zsh-plugins
          location: fd
```

Note: replace `example_username` with the username to install this plugin for.

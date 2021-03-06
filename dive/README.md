# Zsh Plugin: dive

Adds tab-completion for [dive](https://github.com/wagoodman/dive) a tool for
exploring each layer in a Docker image. If `dive` is not installed adds an alias
for running `dive` using Docker.

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins dive
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: dive
          url: gantsign/zsh-plugins
          location: dive
```

Note: replace `example_username` with the username to install this plugin for.

# Zsh Plugin: dive

Adds tab-completion for [dive](https://github.com/wagoodman/dive) a tool for
exploring each layer in a Docker image. If `dive` is not installed adds an alias
for running `dive` using Docker.

Depends on the
[oh-my-zsh docker plugin](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/docker/_docker).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle docker
antigen bundle gantsign/zsh-plugins dive
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: docker
        - name: dive
          url: gantsign/zsh-plugins
          location: dive
```

Note: replace `example_username` with the username to install this plugin for.

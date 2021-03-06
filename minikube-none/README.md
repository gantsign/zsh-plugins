# Zsh Plugin: Minikube None

Make [minikube](https://github.com/kubernetes/minikube) default to
`--vm-driver=none`. Also enables tab-completion support for Minikube.

Essentially transforms:

```bash
minikube <args> start <args>
```

into:

```bash
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true

mkdir -p $HOME/.kube

touch $HOME/.kube/config
export KUBECONFIG=$HOME/.kube/config

sudo --preserve-env minikube --vm-driver=none <args> start --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf <args>
```

Useful if you're already running in a virtual machine (VM) with Docker and can't
run another VM inside your current VM.

Note: if you specify a `--vm-driver` the command will be executed without
transformation (even if it's `none`).

# Installing with [Antigen](https://github.com/zsh-users/antigen)

```bash
antigen bundle gantsign/zsh-plugins minikube-none
```

# Installing with [Ansible Role](https://galaxy.ansible.com/gantsign/antigen)

Add the following to your Ansible playbook:

```yaml
- role: gantsign.antigen
  users:
    - username: example_username
      antigen_bundles:
        - name: minikube-none
          url: gantsign/zsh-plugins
          location: minikube-none
```

Note: replace `example_username` with the username to install this plugin for.

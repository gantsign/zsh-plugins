__minikube_none() {
    local -a pre_args=()
    local -a post_args=()
    local has_vm_driver='false'
    local command=''
    local key

    while [[ $# -gt 0 ]]; do
        if [[ "$command" == '' ]]; then
            case "$1" in
                -b|--bootstrapper|--log_backtrace_at|--log_dir|--loglevel|-p|--profile|--stderrthreshold|-v|--v|--vmodule)
                    pre_args+=("$1")
                    shift
                    pre_args+=("$1")
                    shift
                ;;
                -*)
                    pre_args+=("$1")
                    shift
                ;;
                *)
                    command="$1"
                    shift
                ;;
            esac
        else
            case "$1" in
                --vm-driver*)
                    has_vm_driver='true'
                    post_args+=("$1")
                    shift
                ;;
                *)
                    post_args+=("$1")
                    shift
                ;;
            esac
        fi
    done

    if [[ "$command" == 'start' ]] && [[ "$has_vm_driver" == 'false' ]]; then
        export MINIKUBE_HOME=$HOME
        export CHANGE_MINIKUBE_NONE_USER=true

        mkdir -p $HOME/.kube

        touch $HOME/.kube/config
        export KUBECONFIG=$HOME/.kube/config

        (set -x ; sudo --preserve-env minikube "${pre_args[@]}" "$command" \
            --vm-driver=none "${post_args[@]}")
    else
        minikube "${pre_args[@]}" "$command" "${post_args[@]}"
    fi
}

if [[ $commands[minikube] ]]; then
    source <(minikube completion zsh)

    alias minikube=__minikube_none

    # So tab-completion still works
    compdef __minikube_none='minikube'
fi

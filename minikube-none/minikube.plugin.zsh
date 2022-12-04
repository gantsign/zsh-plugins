if (( $+commands[minikube] )); then
    minikube() {
        local -a pre_args=()
        local -a post_args=()
        local has_vm_driver='false'
        local command=''
        local key

        while [[ $# -gt 0 ]]; do
            if [[ "$command" == '' ]]; then
                case "$1" in
                    --vm-driver*)
                        has_vm_driver='true'
                        pre_args+=("$1")
                        shift
                    ;;
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

            if [ -f /run/systemd/resolve/resolv.conf ]; then
                post_args=('--extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf' "${post_args[@]}")
            fi

            (set -x ; sudo --preserve-env ${commands[minikube]} --vm-driver=none \
                "${pre_args[@]}" "$command" "${post_args[@]}")
        else
            ${commands[minikube]} "${pre_args[@]}" "$command" "${post_args[@]}"
        fi
    }

    ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}"
    # If the completion file does not exist, generate it and then source it
    # Otherwise, source it and regenerate in the background
    if [[ ! -f "$ZSH_CACHE_DIR/completions/_minikube" ]]; then
        mkdir -p "$ZSH_CACHE_DIR"
        minikube completion zsh | tee "$ZSH_CACHE_DIR/completions/_minikube" >/dev/null
        source "$ZSH_CACHE_DIR/completions/_minikube"
    else
        source "$ZSH_CACHE_DIR/completions/_minikube"
        minikube completion zsh | tee "$ZSH_CACHE_DIR/completions/_minikube" >/dev/null &|
    fi
fi

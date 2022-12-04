if (( $+commands[kompose] )); then
    ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}"
    # If the completion file does not exist, generate it and then source it
    # Otherwise, source it and regenerate in the background
    if [[ ! -f "$ZSH_CACHE_DIR/completions/_kompose" ]]; then
        mkdir -p "$ZSH_CACHE_DIR/completions"
        kompose completion zsh | tee "$ZSH_CACHE_DIR/completions/_kompose" >/dev/null
        source "$ZSH_CACHE_DIR/completions/_kompose"
    else
        source "$ZSH_CACHE_DIR/completions/_kompose"
        kompose completion zsh | tee "$ZSH_CACHE_DIR/completions/_kompose" >/dev/null &|
    fi
fi

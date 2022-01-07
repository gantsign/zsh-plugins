if [ $commands[pipenv] ]; then
    eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
fi

__dive_complete_images() {
    images=("${(@f)$(docker images --filter dangling=false --format '{{.Repository}}{{if ne .Tag "<none>"}}\:{{.Tag}}{{end}}' | sort --key=1 --version-sort --unique)}")
    _describe -t docker-images "docker images" images
}

__dive_commands() {
    __dive_complete_images

    local -a commands=(
        'build:Builds and analyzes a docker image from a Dockerfile'
        'help:Help about any command'
        'version:Print the version number and exit'
    )

    _describe -t dive-commands "dive command" commands
}

__dive_subcommand() {
    local -a arguments
    integer ret=1

    case "$words[1]" in
        (build)
            local curcontext="$curcontext"
            curcontext=${curcontext%:*:*}:docker-$words[1]:
            __docker_subcommand && ret=0
            ;;

        (help)
            if [[ ${#words[@]} == 2 ]]; then
                local -a commands=(
                    'build:Builds and analyzes a docker image from a Dockerfile'
                    'help:Help about any command'
                    'version:Print the version number and exit'
                )

                _describe -t dive-commands "help sub command" commands && ret=0
            else
                ret=0
            fi
            ;;

        (version)
            arguments=(
                "(- :)"{-h,--help}'[Help for dive]'
            )

            _arguments -C $arguments && ret=0
            ;;

        (*)
            local I='-h --help'

            arguments=(
                "($I)--config[Config file]:config file:_files"
                "($I)--json[Skip the interactive TUI and write the layer analysis statistics to a given file.]:json file:_files"
                "(- :)"{-h,--help}'[Help for dive]'
            )

            _arguments -C $arguments && ret=0
            ;;
    esac

    return ret
}

_dive() {
    local -a arguments=(
        "(- :)"{-h,--help}'[Help for dive]'
        "(- :)"{-v,--version}'[Display version number]'
        '(-): :->command'
        '(-)*:: :->option-or-argument'
    )

    _arguments -C $arguments && ret=0

    case $state in
        (command)
            __dive_commands && ret=0
        ;;
        (option-or-argument)
            __dive_subcommand && ret=0
        ;;
    esac

    return ret
}

compdef _dive dive

__dive_docker() {
    docker run --rm -it \
        -v /var/run/docker.sock:/var/run/docker.sock \
        wagoodman/dive:latest "$@"
}

if [[ ! $commands[dive] ]]; then
    # If dive ins't installed locally run it through Docker
    alias dive=__dive_docker

    # So tab-completion still works
    compdef __dive_docker='dive'
fi

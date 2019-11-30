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

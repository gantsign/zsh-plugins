if [[ ! $commands[dive] ]]; then
    dive() {
        # If dive ins't installed locally run it through Docker
        docker run --rm -it \
            -v /var/run/docker.sock:/var/run/docker.sock \
            wagoodman/dive:latest "$@"
    }
fi

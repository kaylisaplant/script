#!/usr/bin/env bash

podman-hpc run --net host --rm -it --gpu -e DISPLAY \
    -v /tmp:/tmp \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    -v $HOME/key.json:/home/nonroot/key.json \
    -v $HOME/.local/share/jupyter/kernels/paraview/kernel-helper.sh:/home/nonroot/entrypoint.sh \
    docker.io/jblaschke/pvjupyter:latest "$@"

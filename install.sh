#!/bin/bash
###############################################################################
# Builds and publishes devcontainer images.
###############################################################################

function build_and_publish_image() {
    local image_dir="$1"

    if [[ ! -d "${image_dir}" ]]; then
        echo "ERROR: cannot find image directory: ${image_dir}"
        return 1
    fi

    local image="ghcr.io/sandor-juhasz/devcontainer-images/${image_dir}:latest"

    devcontainer build --workspace-folder "${image_dir}" \
        --image-name "${image}" \
        --buildkit never
    docker push "${image}"
}

build_and_publish_image $1
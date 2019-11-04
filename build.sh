#!/usr/bin/env bash

REGISTRY=medzoner

function build() {
        docker build --build-arg BUILDPATH=./build/${1} -t "${REGISTRY}/${1}" -f ./Dockerfile .
        docker tag  "${REGISTRY}/${1}" "${REGISTRY}/${1}:10.3.0"
        docker push "${REGISTRY}/${1}:10.3.0"
}

function build_and_push_images() {
    build medzoner_node
}

#is ssh agent set ?
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

build_and_push_images
exit 0
#!/bin/bash
set -e

export PY_COLORS=1
export ANSIBLE_FORCE_COLOR=1

cd "${GITHUB_REPOSITORY:-$DOCKER_WORKDIR}"

# shellcheck disable=SC2048
# Must not execute molecule with arguments as one command
molecule $*

#!/usr/bin/env bash

# Prepare test
[[ $# -eq 0 ]] && echo "Invalid parameters." && exit 1
_sourced() {
    if [[ -n "$ZSH_VERSION" ]]; then
        case $ZSH_EVAL_CONTEXT in *:file:*) return 0;; esac
    else
        case ${0##*/} in dash|-dash|bash|-bash|ksh|-ksh|sh|-sh) return 0;; esac
    fi
    return 1
}
_sourced && exit 1

# Global variables
START=$0
[[ -L ${START} ]] && START=$(readlink ${START})
WORKDIR="$(cd $(dirname ${START}); pwd -P)"
source ${WORKDIR}/setenv
pybuild $1
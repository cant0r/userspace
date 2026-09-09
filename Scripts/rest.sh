#!/usr/bin/env bash

_DRY_RUN=0

if [[ $1 == "dry-run" ]]; then
    _DRY_RUN=1
    set -uox pipefail
    echo "Dry-run is set"
elif [[ $1 == "reset" ]]; then
    shutdown -c
    echo "Aborted scheduled shutdown"
    exit 0
else
    set -uo pipefail
fi

shutdown_output=$(shutdown --show 2>&1)
shutdown_exit_code=$?

if [[ $shutdown_exit_code -eq 0 ]]; then
    echo "Shutdown is already scheduled!"
    echo $shutdown_output
    exit 1
fi

weekday=$(date +%A | sed -e "s/.*/\U&/")

if [[ $_DRY_RUN -eq 0 ]]; then
    echo "Calculating shutdown time"
    case $weekday in
        SZERDA)
            shutdown --no-wall 14:00
            ;;
        *)
            shutdown --no-wall 20:00
            ;;
    esac
fi
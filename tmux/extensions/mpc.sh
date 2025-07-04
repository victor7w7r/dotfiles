#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

if ! command -v mpc &>/dev/null; then exit 1; fi
mpc_playback=$(mpc current -f "%artist% - %title%")
echo "${mpc_playback}"

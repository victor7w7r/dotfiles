#!/usr/bin/env bash
# shellcheck source=/dev/null
export LC_ALL=en_US.UTF-8

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$current_dir"/lib/foreground.sh
source "$current_dir"/lib/execext.sh
source "$current_dir"/lib/status.sh

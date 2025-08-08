#!/bin/sh
echo -ne '\033c\033]0;Tank game\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Tank Game.x86_64" "$@"

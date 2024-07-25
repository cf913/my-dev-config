#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$current_dir"/utils.sh

show_timezone=$(get_tmux_option "@tmux2k-show-timezone" false)

get_timezone() {
    if $show_timezone; then
        " " + date +"%Z"
    fi
}

main() {
    timezone=$(get_timezone)
    tmux set-option -g clock-mode-style 24
    # date +"%a %d %b #[fg="#5ff1ff"]%R"
    date +"%a %d %b %R" # <---- using this one
}

main

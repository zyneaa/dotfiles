#!/usr/bin/env bash
# Pane overview for the status-right when a pane is zoomed:
# lists every pane as  <index>:<process> (uniform, no highlighting).

sep=$'\t'
out=""
while IFS="$sep" read -r idx cmd; do
  dispidx=$((idx + 1))   # 1-based, matches the m+<n> bindings
  out+="$dispidx:$cmd "
done < <(tmux list-panes -F "#{pane_index}${sep}#{pane_current_command}")

# strip trailing space
printf '%s' "${out%%?}"
